import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

sealed class TablesState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialTablesState extends TablesState {}

class FetchingTablesState extends TablesState {}

class FetchedTablesState extends TablesState {
  FetchedTablesState(this.tables);

  final List<TableEntity> tables;

  @override
  List<Object> get props => [tables];
}

class FailedTablesState extends TablesState {}