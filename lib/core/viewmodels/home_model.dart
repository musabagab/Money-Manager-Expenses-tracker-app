import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();

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

  init() {
    selectedMonthIndex = DateTime.now().month - 1;
    appBarTitle = months[DateTime.now().month - 1].toUpperCase();
  }
}
