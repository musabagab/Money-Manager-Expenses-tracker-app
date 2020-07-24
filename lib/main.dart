import 'package:flutter/material.dart';
import 'package:moneymanager/locator.dart';
import 'package:moneymanager/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
