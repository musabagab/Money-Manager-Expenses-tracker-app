import 'package:moneymanager/core/database/moor_database.dart';

class MoorDatabaseService {
  final AppDatabase _database = AppDatabase();

  getAllTransactions(String month) async {
    List<Transaction> allTrans = List<Transaction>();

    TransactionDao transactionDao = _database.transactionDao;

    allTrans = await transactionDao.getTransactionForMonth(month).get();
    return allTrans;
  }

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (var value in stream) {
      sum += value;
    }
    return sum;
  }
}
