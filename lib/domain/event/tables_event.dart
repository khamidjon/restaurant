import 'package:equatable/equatable.dart';

sealed class TablesEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchTablesEvent extends TablesEvent {}
