import 'package:flutter/material.dart';
import 'package:restaurant/app/screens/main/tables/tables_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 64),
          Expanded(child: TablesPage()),
        ],
      ),
    );
  }
}
