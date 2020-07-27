import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
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

  titleClicked() {
    isCollabsed = !isCollabsed;
    notifyListeners();
  }

  monthClicked(String clickedMonth) {
    selectedMonthIndex = months.indexOf(clickedMonth);

    appBarTitle = clickedMonth;

    titleClicked();

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
    appBarTitle = months[DateTime.now().month - 1].toUpperCase();
    transactions = await _moorDatabaseService.getAllTransactions();
    notifyListeners();
  }
}
