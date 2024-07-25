import 'package:flutter/material.dart';
import 'package:restaurant/app/navigation/app_router_config.dart';

class RestaurantApp extends StatefulWidget {
  const RestaurantApp({
    super.key,
  });

  @override
  State<RestaurantApp> createState() => _RestaurantAppState();
}

class _RestaurantAppState extends State<RestaurantApp> {
  final _appRouterConfig = AppRouterConfig();

  @override
  void dispose() {
    _appRouterConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouterConfig.router,
    );
  }
}
