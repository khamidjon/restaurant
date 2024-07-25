import 'package:floor/floor.dart';

@entity
class MenuItemRecord {
  @primaryKey
  final int id;

  final double price;
  final String name;

  MenuItemRecord({
    required this.id,
    required this.name,
    required this.price,
  });
}
