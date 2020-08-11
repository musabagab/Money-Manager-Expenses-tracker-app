import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/services/category_icon_service.dart';
import 'package:moneymanager/core/services/moordatabase_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  final MoorDatabaseService _moorDatabaseService =
      locator<MoorDatabaseService>();

  final CategoryIconService _categoryIconService =
      locator<CategoryIconService>();

  ScrollController scrollController =
      new ScrollController(); // set controller on scrolling
  bool show = true;

  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<Transaction> transactions = List<Transaction>();
  bool isCollabsed = false;
  String appBarTitle; // selected month
  String selectedYear;
  int selectedMonthIndex; // from month list above

  int expenseSum = 0;
  int incomeSum = 0;

  monthClicked(String clickedMonth) async {
    selectedMonthIndex = months.indexOf(clickedMonth);
    appBarTitle = clickedMonth;
    transactions = await _moorDatabaseService.getAllTransactions(appBarTitle);
    expenseSum = await _moorDatabaseService.getExpenseSum(appBarTitle);
    incomeSum = await _moorDatabaseService.getIncomeSum(appBarTitle);
    titleClicked();
  }

  titleClicked() {
    isCollabsed = !isCollabsed;
    notifyListeners();
  }

  getColor(month) {
    int monthIndex = months.indexOf(month);
    // color the selected month with
    if (monthIndex == selectedMonthIndex) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  void closeMonthPicker() {
    isCollabsed = false;
    notifyListeners();
  }

  init() async {
    handleScroll();

    selectedMonthIndex = DateTime.now().month - 1;
    appBarTitle = months[selectedMonthIndex];

    expenseSum = await _moorDatabaseService.getExpenseSum(appBarTitle);
    incomeSum = await _moorDatabaseService.getIncomeSum(appBarTitle);

    print("Expense : $expenseSum");
    print("Income : $incomeSum");
    // show the loading bar
    setState(ViewState.Busy);
    notifyListeners();

    transactions = await _moorDatabaseService.getAllTransactions(appBarTitle);
    // show the list
    setState(ViewState.Idle);
    notifyListeners();
  }

  void handleScroll() async {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloationButton();
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloationButton();
      }
    });
  }

  void showFloationButton() {
    show = true;
    notifyListeners();
  }

  void hideFloationButton() {
    show = false;
    notifyListeners();
  }

  Icon getIconForCategory(int index, String type) {
    if (type == 'income') {
      final categoryIcon = _categoryIconService.incomeList.elementAt(index);

      return Icon(
        categoryIcon.icon,
        color: categoryIcon.color,
      );
    } else {
      final categoryIcon = _categoryIconService.expenseList.elementAt(index);

      return Icon(
        categoryIcon.icon,
        color: categoryIcon.color,
      );
    }
  }
}
