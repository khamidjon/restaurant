import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/base_bloc.dart';
import 'package:restaurant/domain/event/order_event.dart';
import 'package:restaurant/domain/repositories/order_repository.dart';
import 'package:restaurant/domain/state/order_state.dart';

class OrderBloc extends BaseBloc<OrderEvent, OrderState> {
  OrderBloc(
    this._orderRepository,
  ) : super(InitialOrderState()) {
    on<FetchOrderEvent>(_handleFetchOrder);
    on<AddOrderEvent>(_handleAddOrder);
    on<RemoveOrderEvent>(_handleRemoveOrder);
  }

  final OrderRepository _orderRepository;

  FutureOr<void> _handleFetchOrder(
    FetchOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    try {
      final data = await _orderRepository.fetchTableOrders(event.table);
      emit(FetchedOrderState(data));
    } on Object catch (_) {
      emit(FailedOrderState());
    }
  }

  FutureOr<void> _handleAddOrder(
    AddOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    try {
      final data = await _orderRepository.insertOrder(event.table, event.item);
      emit(FetchedOrderState(data));
    } on Object catch (_) {
      emit(FailedOrderState());
    }
  }

  FutureOr<void> _handleRemoveOrder(
    RemoveOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    try {
      final data = await _orderRepository.removeOrder(event.table, event.item);
      emit(FetchedOrderState(data));
    } on Object catch (_) {
      emit(FailedOrderState());
    }
  }
}
