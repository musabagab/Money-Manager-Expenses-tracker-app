// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Transaction extends DataClass implements Insertable<Transaction> {
  final String type;
  final String day;
  final String month;
  final String memo;
  final int id;
  final int amount;
  final int categoryindex;
  Transaction(
      {@required this.type,
      @required this.day,
      @required this.month,
      @required this.memo,
      this.id,
      @required this.amount,
      @required this.categoryindex});
  factory Transaction.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Transaction(
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      day: stringType.mapFromDatabaseResponse(data['${effectivePrefix}day']),
      month:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}month']),
      memo: stringType.mapFromDatabaseResponse(data['${effectivePrefix}memo']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amount: intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      categoryindex: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}categoryindex']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || day != null) {
      map['day'] = Variable<String>(day);
    }
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<String>(month);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<int>(amount);
    }
    if (!nullToAbsent || categoryindex != null) {
      map['categoryindex'] = Variable<int>(categoryindex);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      day: day == null && nullToAbsent ? const Value.absent() : Value(day),
      month:
          month == null && nullToAbsent ? const Value.absent() : Value(month),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      categoryindex: categoryindex == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryindex),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      type: serializer.fromJson<String>(json['type']),
      day: serializer.fromJson<String>(json['day']),
      month: serializer.fromJson<String>(json['month']),
      memo: serializer.fromJson<String>(json['memo']),
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      categoryindex: serializer.fromJson<int>(json['categoryindex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<String>(type),
      'day': serializer.toJson<String>(day),
      'month': serializer.toJson<String>(month),
      'memo': serializer.toJson<String>(memo),
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'categoryindex': serializer.toJson<int>(categoryindex),
    };
  }

  Transaction copyWith(
          {String type,
          String day,
          String month,
          String memo,
          int id,
          int amount,
          int categoryindex}) =>
      Transaction(
        type: type ?? this.type,
        day: day ?? this.day,
        month: month ?? this.month,
        memo: memo ?? this.memo,
        id: id ?? this.id,
        amount: amount ?? this.amount,
        categoryindex: categoryindex ?? this.categoryindex,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('type: $type, ')
          ..write('day: $day, ')
          ..write('month: $month, ')
          ..write('memo: $memo, ')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('categoryindex: $categoryindex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      type.hashCode,
      $mrjc(
          day.hashCode,
          $mrjc(
              month.hashCode,
              $mrjc(
                  memo.hashCode,
                  $mrjc(id.hashCode,
                      $mrjc(amount.hashCode, categoryindex.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.type == this.type &&
          other.day == this.day &&
          other.month == this.month &&
          other.memo == this.memo &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.categoryindex == this.categoryindex);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> type;
  final Value<String> day;
  final Value<String> month;
  final Value<String> memo;
  final Value<int> id;
  final Value<int> amount;
  final Value<int> categoryindex;
  const TransactionsCompanion({
    this.type = const Value.absent(),
    this.day = const Value.absent(),
    this.month = const Value.absent(),
    this.memo = const Value.absent(),
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.categoryindex = const Value.absent(),
  });
  TransactionsCompanion.insert({
    @required String type,
    @required String day,
    @required String month,
    @required String memo,
    this.id = const Value.absent(),
    @required int amount,
    @required int categoryindex,
  })  : type = Value(type),
        day = Value(day),
        month = Value(month),
        memo = Value(memo),
        amount = Value(amount),
        categoryindex = Value(categoryindex);
  static Insertable<Transaction> custom({
    Expression<String> type,
    Expression<String> day,
    Expression<String> month,
    Expression<String> memo,
    Expression<int> id,
    Expression<int> amount,
    Expression<int> categoryindex,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (day != null) 'day': day,
      if (month != null) 'month': month,
      if (memo != null) 'memo': memo,
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (categoryindex != null) 'categoryindex': categoryindex,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String> type,
      Value<String> day,
      Value<String> month,
      Value<String> memo,
      Value<int> id,
      Value<int> amount,
      Value<int> categoryindex}) {
    return TransactionsCompanion(
      type: type ?? this.type,
      day: day ?? this.day,
      month: month ?? this.month,
      memo: memo ?? this.memo,
      id: id ?? this.id,
      amount: amount ?? this.amount,
      categoryindex: categoryindex ?? this.categoryindex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (month.present) {
      map['month'] = Variable<String>(month.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (categoryindex.present) {
      map['categoryindex'] = Variable<int>(categoryindex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('type: $type, ')
          ..write('day: $day, ')
          ..write('month: $month, ')
          ..write('memo: $memo, ')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('categoryindex: $categoryindex')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionsTable(this._db, [this._alias]);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dayMeta = const VerificationMeta('day');
  GeneratedTextColumn _day;
  @override
  GeneratedTextColumn get day => _day ??= _constructDay();
  GeneratedTextColumn _constructDay() {
    return GeneratedTextColumn(
      'day',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  GeneratedTextColumn _month;
  @override
  GeneratedTextColumn get month => _month ??= _constructMonth();
  GeneratedTextColumn _constructMonth() {
    return GeneratedTextColumn(
      'month',
      $tableName,
      false,
    );
  }

  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  GeneratedTextColumn _memo;
  @override
  GeneratedTextColumn get memo => _memo ??= _constructMemo();
  GeneratedTextColumn _constructMemo() {
    return GeneratedTextColumn(
      'memo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedIntColumn _amount;
  @override
  GeneratedIntColumn get amount => _amount ??= _constructAmount();
  GeneratedIntColumn _constructAmount() {
    return GeneratedIntColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryindexMeta =
      const VerificationMeta('categoryindex');
  GeneratedIntColumn _categoryindex;
  @override
  GeneratedIntColumn get categoryindex =>
      _categoryindex ??= _constructCategoryindex();
  GeneratedIntColumn _constructCategoryindex() {
    return GeneratedIntColumn(
      'categoryindex',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [type, day, month, memo, id, amount, categoryindex];
  @override
  $TransactionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transactions';
  @override
  final String actualTableName = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day'], _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month'], _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo'], _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('categoryindex')) {
      context.handle(
          _categoryindexMeta,
          categoryindex.isAcceptableOrUnknown(
              data['categoryindex'], _categoryindexMeta));
    } else if (isInserting) {
      context.missing(_categoryindexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Transaction.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TransactionsTable _transactions;
  $TransactionsTable get transactions =>
      _transactions ??= $TransactionsTable(this);
  TransactionDao _transactionDao;
  TransactionDao get transactionDao =>
      _transactionDao ??= TransactionDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TransactionDaoMixin on DatabaseAccessor<AppDatabase> {
  $TransactionsTable get transactions => attachedDatabase.transactions;
  Selectable<Transaction> getTransactionForMonth(String month) {
    return customSelect('SELECT * FROM transactions WHERE month = :month',
        variables: [Variable.withString(month)],
        readsFrom: {transactions}).map(transactions.mapFromRow);
  }

  Selectable<int> sumTheMoneyForMonth(String month, String type) {
    return customSelect(
        'SELECT SUM(amount) FROM transactions WHERE month = :month AND type = :type',
        variables: [
          Variable.withString(month),
          Variable.withString(type)
        ],
        readsFrom: {
          transactions
        }).map((QueryRow row) => row.readInt('SUM(amount)'));
  }

  Selectable<Transaction> getAllTransactionsForType(String month, String type) {
    return customSelect(
        'SELECT * FROM transactions WHERE month = :month AND type = :type',
        variables: [Variable.withString(month), Variable.withString(type)],
        readsFrom: {transactions}).map(transactions.mapFromRow);
  }
}
