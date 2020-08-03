import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class Transactions extends Table {
  TextColumn get type => text()(); //expense /income
  TextColumn get day => text()(); // day
  TextColumn get month => text()(); // month => feb (example)
  TextColumn get assetpath => text()(); // asset path / photo
  TextColumn get memo => text()(); // asset path / photo
  IntColumn get id => integer().autoIncrement()();
  IntColumn get amount => integer()(); // 300 or 200
}

@UseMoor(tables: [Transactions])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;

  Future<List<Transaction>> getAllTransactions() => select(transactions).get();

  Stream<List<Transaction>> watchAllTrans() {
    // Wrap the whole select statement in parenthesis
    return (select(transactions)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..orderBy(
            ([
              // Primary sorting by due date
              (t) => OrderingTerm(expression: t.memo, mode: OrderingMode.asc),
            ]),
          ))
        // watch the whole select statement
        .watch();
  }

  Future insertTransaction(Transaction transaction) =>
      into(transactions).insert(transaction);

  Future updateTransaction(Transaction transaction) =>
      update(transactions).replace(transaction);

  Future deleteTransaction(Transaction transaction) =>
      delete(transactions).delete(transaction);
}
