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
  final String assetpath;
  final String memo;
  final int id;
  final int amount;
  Transaction(
      {@required this.type,
      @required this.day,
      @required this.month,
      @required this.assetpath,
      @required this.memo,
      @required this.id,
      @required this.amount});
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
      assetpath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}assetpath']),
      memo: stringType.mapFromDatabaseResponse(data['${effectivePrefix}memo']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amount: intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
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
    if (!nullToAbsent || assetpath != null) {
      map['assetpath'] = Variable<String>(assetpath);
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
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      day: day == null && nullToAbsent ? const Value.absent() : Value(day),
      month:
          month == null && nullToAbsent ? const Value.absent() : Value(month),
      assetpath: assetpath == null && nullToAbsent
          ? const Value.absent()
          : Value(assetpath),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      type: serializer.fromJson<String>(json['type']),
      day: serializer.fromJson<String>(json['day']),
      month: serializer.fromJson<String>(json['month']),
      assetpath: serializer.fromJson<String>(json['assetpath']),
      memo: serializer.fromJson<String>(json['memo']),
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<String>(type),
      'day': serializer.toJson<String>(day),
      'month': serializer.toJson<String>(month),
      'assetpath': serializer.toJson<String>(assetpath),
      'memo': serializer.toJson<String>(memo),
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
    };
  }

  Transaction copyWith(
          {String type,
          String day,
          String month,
          String assetpath,
          String memo,
          int id,
          int amount}) =>
      Transaction(
        type: type ?? this.type,
        day: day ?? this.day,
        month: month ?? this.month,
        assetpath: assetpath ?? this.assetpath,
        memo: memo ?? this.memo,
        id: id ?? this.id,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('type: $type, ')
          ..write('day: $day, ')
          ..write('month: $month, ')
          ..write('assetpath: $assetpath, ')
          ..write('memo: $memo, ')
          ..write('id: $id, ')
          ..write('amount: $amount')
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
                  assetpath.hashCode,
                  $mrjc(
                      memo.hashCode, $mrjc(id.hashCode, amount.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.type == this.type &&
          other.day == this.day &&
          other.month == this.month &&
          other.assetpath == this.assetpath &&
          other.memo == this.memo &&
          other.id == this.id &&
          other.amount == this.amount);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> type;
  final Value<String> day;
  final Value<String> month;
  final Value<String> assetpath;
  final Value<String> memo;
  final Value<int> id;
  final Value<int> amount;
  const TransactionsCompanion({
    this.type = const Value.absent(),
    this.day = const Value.absent(),
    this.month = const Value.absent(),
    this.assetpath = const Value.absent(),
    this.memo = const Value.absent(),
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
  });
  TransactionsCompanion.insert({
    @required String type,
    @required String day,
    @required String month,
    @required String assetpath,
    @required String memo,
    this.id = const Value.absent(),
    @required int amount,
  })  : type = Value(type),
        day = Value(day),
        month = Value(month),
        assetpath = Value(assetpath),
        memo = Value(memo),
        amount = Value(amount);
  static Insertable<Transaction> custom({
    Expression<String> type,
    Expression<String> day,
    Expression<String> month,
    Expression<String> assetpath,
    Expression<String> memo,
    Expression<int> id,
    Expression<int> amount,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (day != null) 'day': day,
      if (month != null) 'month': month,
      if (assetpath != null) 'assetpath': assetpath,
      if (memo != null) 'memo': memo,
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String> type,
      Value<String> day,
      Value<String> month,
      Value<String> assetpath,
      Value<String> memo,
      Value<int> id,
      Value<int> amount}) {
    return TransactionsCompanion(
      type: type ?? this.type,
      day: day ?? this.day,
      month: month ?? this.month,
      assetpath: assetpath ?? this.assetpath,
      memo: memo ?? this.memo,
      id: id ?? this.id,
      amount: amount ?? this.amount,
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
    if (assetpath.present) {
      map['assetpath'] = Variable<String>(assetpath.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('type: $type, ')
          ..write('day: $day, ')
          ..write('month: $month, ')
          ..write('assetpath: $assetpath, ')
          ..write('memo: $memo, ')
          ..write('id: $id, ')
          ..write('amount: $amount')
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

  final VerificationMeta _assetpathMeta = const VerificationMeta('assetpath');
  GeneratedTextColumn _assetpath;
  @override
  GeneratedTextColumn get assetpath => _assetpath ??= _constructAssetpath();
  GeneratedTextColumn _constructAssetpath() {
    return GeneratedTextColumn(
      'assetpath',
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

  @override
  List<GeneratedColumn> get $columns =>
      [type, day, month, assetpath, memo, id, amount];
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
    if (data.containsKey('assetpath')) {
      context.handle(_assetpathMeta,
          assetpath.isAcceptableOrUnknown(data['assetpath'], _assetpathMeta));
    } else if (isInserting) {
      context.missing(_assetpathMeta);
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
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions];
}
