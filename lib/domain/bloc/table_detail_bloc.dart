import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/base_bloc.dart';
import 'package:restaurant/domain/event/table_detail_event.dart';
import 'package:restaurant/domain/repositories/menu_repository.dart';
import 'package:restaurant/domain/state/table_detail_state.dart';

class TableDetailBloc extends BaseBloc<TableDetailEvent, TableDetailState> {
  TableDetailBloc(
    this._menuRepository,
  ) : super(InitialTableDetailState()) {
    on<FetchMenuTableDetailEvent>(_handleFetchMenu);
  }

  final MenuRepository _menuRepository;

  Future<void> _handleFetchMenu(
    FetchMenuTableDetailEvent event,
    Emitter<TableDetailState> emit,
  ) async {
    emit(FetchingMenuTableDetailState());
    try {
      final data = await _menuRepository.fetchMenu();
      emit(FetchedMenuTableDetailState(data));
    } on Object catch (_) {
      emit(FailedMenuTableDetailState());
    }
  }
}
