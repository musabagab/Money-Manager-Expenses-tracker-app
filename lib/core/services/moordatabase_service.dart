import 'package:moneymanager/core/database/moor_database.dart';

import '../../locator.dart';

class MoorDatabaseService {
  final AppDatabase _database = locator<AppDatabase>();

  getAllTransactions() async {
    List<Transaction> allTrans = await _database.getAllTransactions();

    return allTrans;
  }
}
