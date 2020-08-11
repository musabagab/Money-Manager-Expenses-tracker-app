import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';

import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/app_drawer.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/app_fab.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/app_bar_title_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/empty_transaction_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/month_year_picker_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/summary_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/transactions_listview_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) async => await model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: buildAppBar(model.appBarTitle, model),
        drawer: AppDrawer(context),
        floatingActionButton: Visibility(
          visible: model.show,
          child: AppFAB(model.closeMonthPicker),
        ),
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SummaryWidget(
                        income: model.incomeSum,
                        expense: model.expenseSum,
                      ),
                      buildList(model.transactions, model),
                    ],
                  ),
                  model.isCollabsed
                      ? PickMonthOverlay(
                          model: model,
                          showOrHide: model.isCollabsed,
                          context: context)
                      : Container(),
                ],
              ),
      ),
    );
  }

  buildAppBar(String title, HomeModel model) {
    return AppBar(
      title: AppBarTitle(
        title: title,
        model: model,
      ),
    );
  }

  buildList(List<Transaction> transactions, HomeModel model) {
    return transactions.length == 0
        ? EmptyTransactionsWidget()
        : TransactionsListView(transactions, model);
  }
}
