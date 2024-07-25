import 'package:floor/floor.dart';
import 'package:restaurant/data/local/records/menu_item_record.dart';

@dao
abstract class MenuDao {
  @Query('SELECT * FROM MenuItemRecord')
  Future<List<MenuItemRecord>> fetchMenu();

  @insert
  Future<void> insertMenuItem(MenuItemRecord menuItem);
}
