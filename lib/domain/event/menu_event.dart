import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

sealed class MenuEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchMenuEvent extends MenuEvent {}


