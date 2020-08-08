import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {1: FixedColumnWidth(250)},
      children: [
        TableRow(
          children: [
            Text(
              "Category",
              style: TextStyle(
                fontWeight: FontWeight.w300,
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
                fontWeight: FontWeight.w300,
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
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            Text(
              transaction.day + ", " + transaction.month,
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
                fontWeight: FontWeight.w300,
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
    );
  }
}
