import 'package:flutter/material.dart';
import 'package:restaurant/app/restaurant_app.dart';
import 'package:restaurant/core/di/di_container.dart';
import 'package:restaurant/core/di/inject.dart';
import 'package:restaurant/data/mock_data.dart';
import 'package:restaurant/domain/repositories/menu_repository.dart';
import 'package:restaurant/domain/repositories/tables_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await disposeDi();
  await initDi();

  // await _populateDatabase();

  runApp(
    const RestaurantApp(),
  );
}

Future<void> _populateDatabase() async {
  final tablesRepository = inject<TablesRepository>();
  await tablesRepository.insertTables(mockTables);

  final menuRepository = inject<MenuRepository>();
  await menuRepository.insertMenu(mockMenu);
}
