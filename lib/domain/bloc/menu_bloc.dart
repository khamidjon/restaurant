import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/base_bloc.dart';
import 'package:restaurant/domain/event/menu_event.dart';
import 'package:restaurant/domain/repositories/menu_repository.dart';
import 'package:restaurant/domain/state/menu_state.dart';

class MenuBloc extends BaseBloc<MenuEvent, MenuState> {
  MenuBloc(
    this._menuRepository,
  ) : super(InitialMenuState()) {
    on<FetchMenuEvent>(_handleFetchMenu);
  }

  final MenuRepository _menuRepository;

  Future<void> _handleFetchMenu(
    FetchMenuEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(FetchingMenuState());
    try {
      final data = await _menuRepository.fetchMenu();
      emit(FetchedMenuState(data));
    } on Object catch (_) {
      emit(FailedMenuState());
    }
  }

}
