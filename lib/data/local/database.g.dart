// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  TableDao? _tableDaoInstance;

  MenuDao? _menuDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `TableRecord` (`id` INTEGER NOT NULL, `number` INTEGER NOT NULL, `waiterName` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MenuItemRecord` (`id` INTEGER NOT NULL, `price` REAL NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TableDao get tableDao {
    return _tableDaoInstance ??= _$TableDao(database, changeListener);
  }

  @override
  MenuDao get menuDao {
    return _menuDaoInstance ??= _$MenuDao(database, changeListener);
  }
}

class _$TableDao extends TableDao {
  _$TableDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _tableRecordInsertionAdapter = InsertionAdapter(
            database,
            'TableRecord',
            (TableRecord item) => <String, Object?>{
                  'id': item.id,
                  'number': item.number,
                  'waiterName': item.waiterName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TableRecord> _tableRecordInsertionAdapter;

  @override
  Future<List<TableRecord>> fetchTables() async {
    return _queryAdapter.queryList('SELECT * FROM TableRecord',
        mapper: (Map<String, Object?> row) => TableRecord(row['id'] as int,
            row['number'] as int, row['waiterName'] as String));
  }

  @override
  Future<void> insertTable(TableRecord table) async {
    await _tableRecordInsertionAdapter.insert(table, OnConflictStrategy.abort);
  }
}

class _$MenuDao extends MenuDao {
  _$MenuDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _menuItemRecordInsertionAdapter = InsertionAdapter(
            database,
            'MenuItemRecord',
            (MenuItemRecord item) => <String, Object?>{
                  'id': item.id,
                  'price': item.price,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MenuItemRecord> _menuItemRecordInsertionAdapter;

  @override
  Future<List<MenuItemRecord>> fetchMenu() async {
    return _queryAdapter.queryList('SELECT * FROM MenuItemRecord',
        mapper: (Map<String, Object?> row) => MenuItemRecord(
            id: row['id'] as int,
            name: row['name'] as String,
            price: row['price'] as double));
  }

  @override
  Future<void> insertMenuItem(MenuItemRecord menuItem) async {
    await _menuItemRecordInsertionAdapter.insert(
        menuItem, OnConflictStrategy.abort);
  }
}
