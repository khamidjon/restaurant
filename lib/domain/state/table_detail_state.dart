import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';

sealed class TableDetailState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialTableDetailState extends TableDetailState {}

class FetchingMenuTableDetailState extends TableDetailState {}

class FetchedMenuTableDetailState extends TableDetailState {
  FetchedMenuTableDetailState(this.menu);

  final List<MenuItemEntity> menu;

  @override
  List<Object> get props => [menu];
}

class FailedMenuTableDetailState extends TableDetailState {}
