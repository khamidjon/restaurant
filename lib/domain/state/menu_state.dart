import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';

sealed class MenuState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialMenuState extends MenuState {}

class FetchingMenuState extends MenuState {}

class FetchedMenuState extends MenuState {
  FetchedMenuState(this.menu);

  final List<MenuItemEntity> menu;

  @override
  List<Object> get props => [menu];
}

class FailedMenuState extends MenuState {}
