import 'package:injectable/injectable.dart';
import 'package:restaurant/data/local/database.dart';
import 'package:restaurant/data/mappers/menu_mapper.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';
import 'package:restaurant/domain/repositories/menu_repository.dart';

@Singleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  const MenuRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<List<MenuItemEntity>> fetchMenu() async {
    final tables = await _database.menuDao.fetchMenu();
    return tables.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> insertMenu(List<MenuItemEntity> menu) async {
    final records = menu.map((item) => item.toRecord()).toList();
    for (final record in records) {
      await _database.menuDao.insertMenuItem(record);
    }
  }
}
