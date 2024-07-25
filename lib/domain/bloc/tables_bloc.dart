import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/base_bloc.dart';
import 'package:restaurant/domain/event/tables_event.dart';
import 'package:restaurant/domain/repositories/tables_repository.dart';
import 'package:restaurant/domain/state/tables_state.dart';

class TablesBloc extends BaseBloc<TablesEvent, TablesState> {
  TablesBloc(
    this._tablesRepository,
  ) : super(InitialTablesState()) {
    on<FetchTablesEvent>(_handleFetchTables);
  }

  final TablesRepository _tablesRepository;

  Future<void> _handleFetchTables(
    FetchTablesEvent event,
    Emitter<TablesState> emit,
  ) async {
    emit(FetchingTablesState());
    try {
      final data = await _tablesRepository.getTables();
      emit(FetchedTablesState(data));
    } on Object catch (_) {
      emit(FailedTablesState());
    }
  }
}
