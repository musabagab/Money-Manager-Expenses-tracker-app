import 'package:flutter/material.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';

import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/app_drawer.dart';
import 'package:moneymanager/ui/widgets/common_widgets/app_fab.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/empty_transaction_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/month_year_picker_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/summary_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) async => await model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: buildAppBar(model.appBarTitle, model),
        drawer: AppDrawer(context),
        floatingActionButton: AppFAB(),
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SummaryWidget(
                        income: 3000,
                        expense: 400,
                      ),
                      model.transactions.length == 0
                          ? EmptyTransactionsWidget()
                          : Flexible(
                              child: ListView(
                                padding: EdgeInsets.all(8),
                                children: model.transactions
                                    .map((e) => Text(e.day))
                                    .toList(),
                              ),
                            ),
                    ],
                  ),
                  model.isCollabsed
                      ? buildOverlayPicker(model.isCollabsed, model, context)
                      : Container(),
                ],
              ),
      ),
    );
  }

  buildOverlayPicker(showOrHide, HomeModel model, BuildContext context) {
    return PickMonthAndYearOverlay(
        model: model, showOrHide: showOrHide, context: context);
  }

  buildAppBar(String title, HomeModel model) {
    return AppBar(
      title: InkWell(
        onTap: () {
          model.titleClicked();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              model.isCollabsed
                  ? Icon(
                      Icons.arrow_drop_down,
                    )
                  : Icon(
                      Icons.arrow_drop_up,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
