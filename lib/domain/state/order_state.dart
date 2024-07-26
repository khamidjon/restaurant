import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';

sealed class OrderState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialOrderState extends OrderState {}

class FetchingOrderState extends OrderState {}

class FetchedOrderState extends OrderState {
  FetchedOrderState(this.menu);

  final List<MenuItemEntity> menu;

  @override
  List<Object> get props => [menu];
}

class FailedOrderState extends OrderState {}
