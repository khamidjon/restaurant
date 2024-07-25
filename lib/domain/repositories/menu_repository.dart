import 'package:restaurant/domain/entities/menu_item_entity.dart';

abstract class MenuRepository {
  Future<List<MenuItemEntity>> fetchMenu();

  Future<void> insertMenu(List<MenuItemEntity> menu);
}
