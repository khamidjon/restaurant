import 'package:floor/floor.dart';

@Entity(primaryKeys: ['tableId', 'menuItemId'], tableName: 'orders')
class OrderRecord {
  final int tableId;
  final int menuItemId;

  OrderRecord(
    this.tableId,
    this.menuItemId,
  );
}
