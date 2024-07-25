import 'package:equatable/equatable.dart';

class MenuItemEntity with EquatableMixin {
  const MenuItemEntity({
    required this.id,
    required this.price,
    required this.name,
  });

  final int id;
  final double price;
  final String name;

  @override
  List<Object> get props => [id];
}
