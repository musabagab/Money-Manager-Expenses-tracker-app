import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';
import 'package:moneymanager/ui/shared/app_colors.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(child: Text('This is home'))),
    );
  }
}
