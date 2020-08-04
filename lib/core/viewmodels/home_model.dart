import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/services/moordatabase_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  final MoorDatabaseService _moorDatabaseService =
      locator<MoorDatabaseService>();

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

  monthClicked(String clickedMonth) async {
    selectedMonthIndex = months.indexOf(clickedMonth);
    appBarTitle = clickedMonth;
    transactions = await _moorDatabaseService.getAllTransactions(appBarTitle);
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

  init() async {
    selectedMonthIndex = DateTime.now().month - 1;
    appBarTitle = months[selectedMonthIndex];

    setState(ViewState.Busy);
    notifyListeners();

    transactions = await _moorDatabaseService.getAllTransactions(appBarTitle);

    setState(ViewState.Idle);
    notifyListeners();
  }
}
