import 'package:flutter/material.dart';
import 'package:restaurant/app/restaurant_app.dart';
import 'package:restaurant/core/di/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();

  runApp(
    const RestaurantApp(),
  );
}
