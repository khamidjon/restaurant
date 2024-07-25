import 'package:equatable/equatable.dart';

sealed class TableDetailEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchMenuTableDetailEvent extends TableDetailEvent {}
