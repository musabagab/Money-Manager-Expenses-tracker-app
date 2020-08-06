import 'package:flutter/material.dart';
import 'package:moneymanager/core/models/category.dart';
import 'package:moneymanager/core/viewmodels/insert_transaction_model.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';
import 'package:moneymanager/ui/views/base_view.dart';

class InsertTranscationView extends StatefulWidget {
  final Category category;
  final int selectedCategory;
  InsertTranscationView(this.category, this.selectedCategory);

  @override
  _InsertTranscationViewState createState() => _InsertTranscationViewState();
}

class _InsertTranscationViewState extends State<InsertTranscationView> {
  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());
    if (picked != null) setState(() => _value = picked.toString());

    print(picked.day);
    print(picked.month);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController memoController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    return BaseView<InsertTransactionModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:
              widget.selectedCategory == 1 ? Text('Income') : Text('Expense'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                buildTextField(memoController, 'Memo:',
                    "Enter a memo for your transcation", Icons.edit, false),
                UIHelper.verticalSpaceMedium(),
                buildTextField(
                    amountController,
                    'Amount:',
                    "Enter a the amount for the transcation",
                    Icons.attach_money,
                    true),
                RaisedButton(onPressed: () async {
                  await _selectDate();
                })
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
