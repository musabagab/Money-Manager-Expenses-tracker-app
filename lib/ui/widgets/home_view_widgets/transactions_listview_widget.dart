import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';

class TransactionsListView extends StatelessWidget {
  final List<Transaction> transactions;
  final HomeModel model;

  const TransactionsListView(
    this.transactions,
    this.model,
  );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: transactions.map((transaction) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "details", arguments: transaction);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          transaction.day + '/' + transaction.month,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          transaction.type +
                              ": " +
                              transaction.amount.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        foregroundColor: model
                            .getIconForCategory(
                                transaction.categoryindex, transaction.type)
                            .color,
                        child: model.getIconForCategory(
                            transaction.categoryindex, transaction.type),
                      ),
                      title: Text(transaction.memo),
                      trailing: Text(transaction.amount.toString(),
                          style: TextStyle(fontSize: 20)),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
