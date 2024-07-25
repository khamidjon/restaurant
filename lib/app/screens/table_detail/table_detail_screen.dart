import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/app/screens/table_detail/table_detail_screen_viewmodel.dart';
import 'package:restaurant/domain/bloc/table_detail_bloc.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/state/table_detail_state.dart';

class TableDetailScreen extends StatefulWidget {
  const TableDetailScreen({
    required this.table,
    super.key,
  });

  final TableEntity table;

  @override
  State<TableDetailScreen> createState() => _TableDetailScreenState();
}

class _TableDetailScreenState extends State<TableDetailScreen> {
  final _viewModel = TableDetailScreenViewModel();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchMenu(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text( 'T ${widget.table.number}'),
      ),
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          Divider(),
          Expanded(
            child: BlocBuilder<TableDetailBloc, TableDetailState>(
              builder: (BuildContext context, TableDetailState state) {
                if (state is FetchedMenuTableDetailState) {
                  final menu = state.menu;
                  return ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (_, index) {
                      final item = menu[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: Text('${item.price} \$'),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
