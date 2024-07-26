import 'package:restaurant/domain/entities/menu_item_entity.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

abstract class OrderRepository {
  Future<List<MenuItemEntity>> fetchTableOrders(TableEntity table);

  Future<List<MenuItemEntity>> insertOrder(
    TableEntity table,
    MenuItemEntity item,
  );

  Future<List<MenuItemEntity>> removeOrder(
    TableEntity table,
    MenuItemEntity item,
  );
}
