import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/menu_bloc.dart';
import 'package:restaurant/domain/bloc/order_bloc.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/event/menu_event.dart';
import 'package:restaurant/domain/event/order_event.dart';

class TableDetailScreenViewModel {
  void fetchMenu(BuildContext context) {
    context.read<MenuBloc>().add(FetchMenuEvent());
  }

  void fetchOrders(BuildContext context, TableEntity table) {
    context.read<OrderBloc>().add(FetchOrderEvent(table));
  }

  void addOrder(BuildContext context, TableEntity table, MenuItemEntity item) {
    context.read<OrderBloc>().add(AddOrderEvent(table, item));
  }

  void removeOrder(
      BuildContext context, TableEntity table, MenuItemEntity item) {
    context.read<OrderBloc>().add(RemoveOrderEvent(table, item));
  }
}
