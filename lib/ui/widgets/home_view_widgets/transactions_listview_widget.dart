import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';

class TransactionsListView extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsListView({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: transactions.map((e) {
          return Card(
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          e.day + '/' + e.month,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          e.type + ": " + e.amount.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.payment),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple,
                      ),
                      title: Text(e.memo),
                      trailing: Text(e.amount.toString(),
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
