import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/bloc/table_detail_bloc.dart';
import 'package:restaurant/domain/event/table_detail_event.dart';

class TableDetailScreenViewModel {
  void fetchMenu(BuildContext context) {
    context.read<TableDetailBloc>().add(FetchMenuTableDetailEvent());
  }
}
