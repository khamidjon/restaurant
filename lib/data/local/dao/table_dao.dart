import 'package:floor/floor.dart';
import 'package:restaurant/data/local/records/table_record.dart';

@dao
abstract class TableDao {
  @Query("SELECT * FROM TableRecord")
  Future<List<TableRecord>> fetchTables();

  @insert
  Future<void> insertTable(TableRecord table);
}
