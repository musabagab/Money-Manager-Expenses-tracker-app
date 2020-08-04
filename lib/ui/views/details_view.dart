import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';

class DetailsView extends StatelessWidget {
  final Transaction transaction;
  DetailsView(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text('Details'), Icon(Icons.delete)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.payment),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  title: Text(
                    "\t\t\t" + "Awards",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                UIHelper.verticalSpaceSmall(),
                Table(
                  columnWidths: {1: FixedColumnWidth(250)},
                  children: [
                    TableRow(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          transaction.type,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "Money",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          transaction.amount.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          transaction.day + "." + transaction.month,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "Memo",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          transaction.memo,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 20,
          ),
        ),
        UIHelper.horizontalSpaceMedium(),
        Text(
          value,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
