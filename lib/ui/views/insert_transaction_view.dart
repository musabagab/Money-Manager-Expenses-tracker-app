import 'package:flutter/material.dart';
import 'package:moneymanager/core/models/category.dart';
import 'package:moneymanager/core/viewmodels/insert_transaction_model.dart';
import 'package:moneymanager/ui/shared/app_colors.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';
import 'package:moneymanager/ui/views/base_view.dart';

class InsertTranscationView extends StatelessWidget {
  final Category category;
  final int selectedCategory;
  InsertTranscationView(this.category, this.selectedCategory);
  @override
  Widget build(BuildContext context) {
    return BaseView<InsertTransactionModel>(
      onModelReady: (model) => model.init(selectedCategory, category.index),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: selectedCategory == 1 ? Text('Income') : Text('Expense'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(category.name),
                  leading: CircleAvatar(
                      child: Icon(
                    category.icon,
                    size: 20,
                  )),
                ),
                UIHelper.verticalSpaceMedium(),
                buildTextField(model.memoController, 'Memo:',
                    "Enter a memo for your transcation", Icons.edit, false),
                UIHelper.verticalSpaceMedium(),
                buildTextField(
                    model.amountController,
                    'Amount:',
                    "Enter a the amount for the transcation",
                    Icons.attach_money,
                    true),
                UIHelper.verticalSpaceMedium(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SELECT DATE:',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  width: 20,
                  height: 50,
                  child: RaisedButton(
                    child: Text(model.getSelectedDate()),
                    onPressed: () async {
                      await model.selectDate(context);
                    },
                  ),
                ),
                UIHelper.verticalSpaceLarge(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RaisedButton(
                    child: Text(
                      'ADD',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: backgroundColor,
                    textColor: Colors.black,
                    onPressed: () async {
                      await model.addTransaction(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextField(TextEditingController controller, String text,
      String helperText, IconData icon, isNumeric) {
    return TextFormField(
      cursorColor: Colors.black,
      maxLength: isNumeric ? 10 : 40,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        labelText: text,
        suffixIcon: InkWell(
          onTap: () {
            controller.clear();
          },
          child: Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFFF000000),
        ),
        helperText: helperText,
      ),
    );
  }
}
