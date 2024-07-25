import 'package:floor/floor.dart';

@entity
class TableRecord {
  @primaryKey
  final int id;

  final int number;
  final String waiterName;

  TableRecord(
    this.id,
    this.number,
    this.waiterName,
  );
}
