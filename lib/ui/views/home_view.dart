import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';

import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/common_widgets/my_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) => Scaffold(
        appBar: MyAppBar.getAppBar('Home', false),
        body: SafeArea(
          child: Text('Hi'),
        ),
      ),
    );
  }
}
