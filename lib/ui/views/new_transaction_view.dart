import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/new_transcation_model.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';
import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/new_transaction_view_widget/transaction_type_spinner.dart';

class NewTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NewTransactionModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: TransactionTypeSpinner(
              model.selectedItem, model.changeSelectedItem),
        ),
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1.2,
            padding: EdgeInsets.all(8),
            children: model
                .loadCategoriesIcons()
                .map((e) => Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(e.name),
                            UIHelper.verticalSpaceSmall(),
                            CircleAvatar(
                              radius: 25,
                              child: Icon(
                                e.icon,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    )))
                .toList(),
          ),
        ),
      ),
    );
  }
}
