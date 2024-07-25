import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/app/navigation/app_route.dart';
import 'package:restaurant/domain/bloc/tables_bloc.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/event/tables_event.dart';

class TablesPageViewModel {
  void fetchTables(BuildContext context) {
    context.read<TablesBloc>().add(FetchTablesEvent());
  }

  void openDetail(BuildContext context, TableEntity table) {
    context.pushNamed(AppRoute.detail, extra: table);
  }
}
