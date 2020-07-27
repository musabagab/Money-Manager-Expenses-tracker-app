import 'package:flutter/material.dart';

import 'package:moneymanager/ui/shared/app_colors.dart';

class AppFAB extends StatelessWidget {
  const AppFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add, color: Colors.black38),
      backgroundColor: backgroundColor,
    );
  }
}
