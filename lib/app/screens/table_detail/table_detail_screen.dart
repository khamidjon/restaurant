import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/app/screens/table_detail/table_detail_screen_viewmodel.dart';
import 'package:restaurant/domain/bloc/menu_bloc.dart';
import 'package:restaurant/domain/bloc/order_bloc.dart';
import 'package:restaurant/domain/entities/table_entity.dart';
import 'package:restaurant/domain/state/menu_state.dart';
import 'package:restaurant/domain/state/order_state.dart';

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
      _viewModel.fetchOrders(context, widget.table);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('T ${widget.table.number}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (BuildContext context, OrderState state) {
                if (state is FetchedOrderState) {
                  final menu = state.menu;
                  return ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (_, index) {
                      final item = menu[index];
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            _viewModel.removeOrder(context, widget.table, item);
                          },
                        ),
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
          const Divider(),
          Expanded(
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (BuildContext context, MenuState state) {
                if (state is FetchedMenuState) {
                  final menu = state.menu;
                  return ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (_, index) {
                      final item = menu[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: Text('${item.price} \$'),
                        onTap: () {
                          _viewModel.addOrder(context, widget.table, item);
                        },
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
