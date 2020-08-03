import 'package:moneymanager/core/database/moor_database.dart';

class MoorDatabaseService {
  final AppDatabase _database = AppDatabase();

  getAllTransactions() async {
    List<Transaction> allTrans = List<Transaction>();

    await _database.watchAllTrans().listen((event) {
      event.forEach((element) {
        allTrans.add(element);
      });
    });

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
