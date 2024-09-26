// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ReceiptDetailDao? _receiptListDataDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ReceiptDetailModel` (`rowId` INTEGER PRIMARY KEY AUTOINCREMENT, `saleOrderId` TEXT, `restaurantId` TEXT, `restaurantName` TEXT, `webUserId` TEXT, `orderNo` TEXT, `orderDate` TEXT, `orderTypeId` TEXT, `specialInstructions` TEXT, `referenceId` TEXT, `receiptNo` TEXT, `receiptDate` TEXT, `receiptTime` TEXT, `orderStatus` TEXT, `subTotal` TEXT, `tax` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ReceiptDetailDao get receiptListDataDao {
    return _receiptListDataDaoInstance ??=
        _$ReceiptDetailDao(database, changeListener);
  }
}

class _$ReceiptDetailDao extends ReceiptDetailDao {
  _$ReceiptDetailDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _receiptDetailModelInsertionAdapter = InsertionAdapter(
            database,
            'ReceiptDetailModel',
            (ReceiptDetailModel item) => <String, Object?>{
                  'rowId': item.rowId,
                  'saleOrderId': item.saleOrderId,
                  'restaurantId': item.restaurantId,
                  'restaurantName': item.restaurantName,
                  'webUserId': item.webUserId,
                  'orderNo': item.orderNo,
                  'orderDate': item.orderDate,
                  'orderTypeId': item.orderTypeId,
                  'specialInstructions': item.specialInstructions,
                  'referenceId': item.referenceId,
                  'receiptNo': item.receiptNo,
                  'receiptDate': item.receiptDate,
                  'receiptTime': item.receiptTime,
                  'orderStatus': item.orderStatus,
                  'subTotal': item.subTotal,
                  'tax': item.tax
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ReceiptDetailModel>
      _receiptDetailModelInsertionAdapter;

  @override
  Future<List<ReceiptDetailModel>> findAllReceiptDetails() async {
    return _queryAdapter.queryList('SELECT * FROM ReceiptDetailModel',
        mapper: (Map<String, Object?> row) => ReceiptDetailModel(
            saleOrderId: row['saleOrderId'] as String?,
            restaurantId: row['restaurantId'] as String?,
            restaurantName: row['restaurantName'] as String?,
            webUserId: row['webUserId'] as String?,
            orderNo: row['orderNo'] as String?,
            orderDate: row['orderDate'] as String?,
            orderTypeId: row['orderTypeId'] as String?,
            specialInstructions: row['specialInstructions'] as String?,
            referenceId: row['referenceId'] as String?,
            receiptNo: row['receiptNo'] as String?,
            receiptDate: row['receiptDate'] as String?,
            receiptTime: row['receiptTime'] as String?,
            orderStatus: row['orderStatus'] as String?,
            subTotal: row['subTotal'] as String?,
            tax: row['tax'] as String?));
  }

  @override
  Stream<ReceiptDetailModel?> findReceiptDetailByID(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM ReceiptDetailModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ReceiptDetailModel(
            saleOrderId: row['saleOrderId'] as String?,
            restaurantId: row['restaurantId'] as String?,
            restaurantName: row['restaurantName'] as String?,
            webUserId: row['webUserId'] as String?,
            orderNo: row['orderNo'] as String?,
            orderDate: row['orderDate'] as String?,
            orderTypeId: row['orderTypeId'] as String?,
            specialInstructions: row['specialInstructions'] as String?,
            referenceId: row['referenceId'] as String?,
            receiptNo: row['receiptNo'] as String?,
            receiptDate: row['receiptDate'] as String?,
            receiptTime: row['receiptTime'] as String?,
            orderStatus: row['orderStatus'] as String?,
            subTotal: row['subTotal'] as String?,
            tax: row['tax'] as String?),
        arguments: [id],
        queryableName: 'ReceiptDetailModel',
        isView: false);
  }

  @override
  Future<void> deleteAllReceiptDetail() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ReceiptDetailModel');
  }

  @override
  Future<void> insertReceiptDetail(ReceiptDetailModel appDetail) async {
    await _receiptDetailModelInsertionAdapter.insert(
        appDetail, OnConflictStrategy.abort);
  }
}
