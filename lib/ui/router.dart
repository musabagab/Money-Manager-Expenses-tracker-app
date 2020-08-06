import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/ui/views/details_view.dart';
import 'package:moneymanager/ui/views/new_transaction_view.dart';
import 'package:moneymanager/ui/views/spash_view.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SpashView());
      case 'newtransaction':
        return MaterialPageRoute(builder: (_) => NewTransactionView());
      case 'details':
        var transaction = settings.arguments as Transaction;
        return MaterialPageRoute(builder: (_) => DetailsView(transaction));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
