import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/app/screens/main/tables/tables_page_viewmodel.dart';
import 'package:restaurant/app/screens/main/tables/widgets/table_item_widget.dart';
import 'package:restaurant/domain/bloc/tables_bloc.dart';
import 'package:restaurant/domain/state/tables_state.dart';

class TablesPage extends StatefulWidget {
  const TablesPage({super.key});

  @override
  State<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  final _viewModel = TablesPageViewModel();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchTables(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tables Service',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: BlocBuilder<TablesBloc, TablesState>(
            builder: (BuildContext context, TablesState state) {
              if (state is FetchedTablesState) {
                final tables = state.tables;
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // number of items in each row
                    mainAxisSpacing: 16.0, // spacing between rows
                    crossAxisSpacing: 16.0, // sp
                    childAspectRatio: 1, // acing between columns
                  ),
                  itemCount: tables.length,
                  itemBuilder: (_, index) {
                    final item = tables[index];
                    return TableItemWidget(
                      item: item,
                      onTap: (a) {},
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
    );
  }
}
