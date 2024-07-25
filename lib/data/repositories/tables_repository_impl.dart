import 'package:injectable/injectable.dart';
import 'package:restaurant/data/local/database.dart';
import 'package:restaurant/data/mappers/table_mapper.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/repositories/tables_repository.dart';

@Singleton(as: TablesRepository)
class TablesRepositoryImpl implements TablesRepository {
  const TablesRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<List<TableEntity>> getTables() async {
    final tables = await _database.tableDao.fetchTables();
    return tables.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> insertTables(List<TableEntity> tables) async {
    final records = tables.map((item) => item.toRecord()).toList();
    for (final record in records) {
      await _database.tableDao.insertTable(record);
    }
  }
}
