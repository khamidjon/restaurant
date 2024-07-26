import 'package:equatable/equatable.dart';

sealed class MenuEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchMenuEvent extends MenuEvent {}


