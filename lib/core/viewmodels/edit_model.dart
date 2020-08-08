import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/models/category.dart';
import 'package:moneymanager/core/services/category_icon_service.dart';
import 'package:moneymanager/core/services/moordatabase_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';
import 'package:toast/toast.dart';

import '../../locator.dart';

class EditModel extends BaseModel {
  TextEditingController memoController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final MoorDatabaseService _moorDatabaseService =
      locator<MoorDatabaseService>();

  final CategoryIconService _categoryIconService =
      locator<CategoryIconService>();

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

  String selectedDay;
  String selectedMonth;
  DateTime selectedDate = new DateTime.now();
  Category category;

  Future selectDate(context) async {
    // hide the keyboard
    unFocusFromTheTextField(context);

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (picked != null) {
      selectedMonth = months[picked.month - 1];
      selectedDay = picked.day.toString();
      selectedDate = picked;

      notifyListeners();
    }
  }

  void unFocusFromTheTextField(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  String getSelectedDate() {
    if (int.parse(selectedDay) == DateTime.now().day &&
        DateTime.now().month == months.indexOf(selectedMonth) + 1) {
      return 'Today ' + selectedMonth + ',' + selectedDay;
    } else {
      return selectedMonth + ',' + selectedDay;
    }
  }

  void init(Transaction transaction) {
    // initla values are current day and month
    selectedMonth = transaction.month;
    selectedDay = transaction.day;
    if (transaction.type == 'income') {
      category =
          _categoryIconService.incomeList.elementAt(transaction.categoryindex);
    } else {
      category =
          _categoryIconService.expenseList.elementAt(transaction.categoryindex);
    }
    memoController.text = transaction.memo;
    amountController.text = transaction.amount.toString();
    notifyListeners();
  }

  editTransaction(context, type, categoryIndex, id) async {
    String memo = memoController.text;
    String amount = amountController.text;

    if (memo.length == 0 || amount.length == 0) {
      Toast.show("Please fill all the fields!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }

    Transaction updatedTransaction = new Transaction(
        type: type,
        day: selectedDay,
        id: id,
        month: selectedMonth,
        memo: memoController.text,
        amount: int.parse(amount),
        categoryindex: categoryIndex);
    // insert it!
    await _moorDatabaseService.updateTransaction(updatedTransaction);

    Toast.show("Edited successfully!", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    // return to the home

    Navigator.of(context).pushNamedAndRemoveUntil(
        'details', (Route<dynamic> route) => false,
        arguments: updatedTransaction);
  }
}
