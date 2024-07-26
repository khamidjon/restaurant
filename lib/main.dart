import 'package:flutter/material.dart';
import 'package:restaurant/app/restaurant_app.dart';
import 'package:restaurant/core/di/di_container.dart';
import 'package:restaurant/core/di/inject.dart';
import 'package:restaurant/data/mock_data.dart';
import 'package:restaurant/domain/repositories/menu_repository.dart';
import 'package:restaurant/domain/repositories/order_repository.dart';
import 'package:restaurant/domain/repositories/tables_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await disposeDi();
  await initDi();

  // await _populateTables();
  // await _populateMenu();
  // await _populateOrders();

  runApp(
    const RestaurantApp(),
  );
}

Future<void> _populateTables() async {
  final tablesRepository = inject<TablesRepository>();
  await tablesRepository.insertTables(mockTables);
}

Future<void> _populateMenu() async {
  final menuRepository = inject<MenuRepository>();
  await menuRepository.insertMenu(mockMenu);
}

Future<void> _populateOrders() async {
  final repo = inject<OrderRepository>();
  await repo.insertOrder(mockTables[0], mockMenu[0]);
}
