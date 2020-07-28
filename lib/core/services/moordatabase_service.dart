import 'package:moneymanager/core/database/moor_database.dart';

class MoorDatabaseService {
  final AppDatabase _database = AppDatabase();

  getAllTransactions() async {
    List<Transaction> allTrans = await _database.getAllTransactions();

    return allTrans;
  }
}
