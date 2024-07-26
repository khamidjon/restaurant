import 'package:floor/floor.dart';
import 'package:restaurant/data/local/records/order_record.dart';

@dao
abstract class OrderDao {
  @Query('SELECT menuItemId FROM orders WHERE tableId = :tableId')
  Future<List<int>> fetchTableOrders(int tableId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrder(OrderRecord order);

  @delete
  Future<void> deleteOrder(OrderRecord order);
}
