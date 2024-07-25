import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/app/navigation/app_route.dart';
import 'package:restaurant/app/screens/main/main_screen.dart';
import 'package:restaurant/app/screens/table_detail/table_detail_screen.dart';
import 'package:restaurant/core/di/inject.dart';
import 'package:restaurant/domain/bloc/table_detail_bloc.dart';
import 'package:restaurant/domain/bloc/tables_bloc.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

class AppRouterConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.main,
  );

  void dispose() {}

  late final _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.main,
      builder: (_, __) => BlocProvider(
        create: (_) => TablesBloc(inject()),
        child: const MainScreen(),
      ),
    ),
    GoRoute(
      path: '/details',
      name: AppRoute.detail,
      builder: (_, state) => BlocProvider(
        create: (_) => TableDetailBloc(inject()),
        child: TableDetailScreen(table: state.extra as TableEntity),
      ),
    ),
  ];
}
