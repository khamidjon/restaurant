import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

sealed class OrderEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchOrderEvent extends OrderEvent {
  FetchOrderEvent(this.table);

  final TableEntity table;
}

class AddOrderEvent extends OrderEvent {
  AddOrderEvent(this.table, this.item);

  final TableEntity table;
  final MenuItemEntity item;

  @override
  List<Object?> get props => [table, item];
}

class RemoveOrderEvent extends OrderEvent {
  RemoveOrderEvent(this.table, this.item);

  final TableEntity table;
  final MenuItemEntity item;

  @override
  List<Object?> get props => [table, item];
}
