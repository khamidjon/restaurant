import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/tables_bloc.dart';
import 'package:restaurant/domain/event/tables_event.dart';

class TablesPageViewModel {
  void fetchTables(BuildContext context) {
    context.read<TablesBloc>().add(FetchTablesEvent());
  }
}
