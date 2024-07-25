import 'package:restaurant/domain/entities/table_entity.dart';

abstract class TablesRepository {
  Future<List<TableEntity>> getTables();
}
