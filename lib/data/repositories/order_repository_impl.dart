import 'package:injectable/injectable.dart';
import 'package:restaurant/data/local/database.dart';
import 'package:restaurant/data/local/records/order_record.dart';
import 'package:restaurant/data/mappers/menu_mapper.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/repositories/order_repository.dart';

@Singleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<List<MenuItemEntity>> fetchTableOrders(TableEntity table) async {
    final menuItemIds = await _database.orderDao.fetchTableOrders(table.id);
    final list = <MenuItemEntity>[];
    for (final id in menuItemIds) {
      final menuItem = await _database.menuDao.findMenuItem(id);
      if (menuItem != null) list.add(menuItem.toEntity());
    }
    return list;
  }

  @override
  Future<List<MenuItemEntity>> insertOrder(
    TableEntity table,
    MenuItemEntity item,
  ) async {
    final record = OrderRecord(table.id, item.id);
    await _database.orderDao.insertOrder(record);
    return await fetchTableOrders(table);
  }

  @override
  Future<List<MenuItemEntity>> removeOrder(
    TableEntity table,
    MenuItemEntity item,
  ) async {
    final record = OrderRecord(table.id, item.id);
    await _database.orderDao.deleteOrder(record);
    return await fetchTableOrders(table);
  }
}
