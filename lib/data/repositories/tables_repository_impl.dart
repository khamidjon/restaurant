import 'package:injectable/injectable.dart';
import 'package:restaurant/data/local/mock_data.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/repositories/tables_repository.dart';

@Singleton(as: TablesRepository)
class TablesRepositoryImpl implements TablesRepository {
  const TablesRepositoryImpl();

  @override
  Future<List<TableEntity>> getTables() async {
    await Future.delayed(const Duration(seconds: 2));
    return tables;
  }
}
