import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/viewmodels/details_model.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';
import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/details_view_widgets/details_table.dart';

class DetailsView extends StatelessWidget {
  final Transaction transaction;
  DetailsView(this.transaction);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsModel>(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Details'),
                    InkWell(
                      child: Icon(Icons.delete),
                      onTap: () async {
                        await model.deleteTransacation(transaction);
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
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
                              radius: 25,
                              backgroundColor:
                                  Colors.blueAccent.withOpacity(.15),
                              child: model.getIconForCategory(
                                  transaction.categoryindex, transaction.type)),
                          title: Text(
                            "\t\t\t" +
                                model.getCategoryIconName(
                                    transaction.categoryindex,
                                    transaction.type),
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        UIHelper.verticalSpaceSmall(),
                        DetailsTable(transaction: transaction),
                      ],
                    ),
                  ),
                ),
              ),
            ));
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
