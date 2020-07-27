import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/locator.dart';
import 'package:moneymanager/ui/shared/app_colors.dart';

class AppFAB extends StatelessWidget {
  const AppFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final AppDatabase _database = locator<AppDatabase>();

        _database.insertTransaction(Transaction(
            amount: 300,
            day: "25",
            month: "Feb",
            assetpath: "myimage.png",
            type: "expense"));
      },
      child: Icon(Icons.add, color: Colors.black38),
      backgroundColor: backgroundColor,
    );
  }
}
