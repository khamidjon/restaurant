import 'dart:async';
import 'package:floor/floor.dart';
import 'package:restaurant/data/local/dao/menu_dao.dart';
import 'package:restaurant/data/local/dao/order_dao.dart';
import 'package:restaurant/data/local/dao/table_dao.dart';
import 'package:restaurant/data/local/records/menu_item_record.dart';
import 'package:restaurant/data/local/records/order_record.dart';
import 'package:restaurant/data/local/records/table_record.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [TableRecord, MenuItemRecord, OrderRecord])
abstract class AppDatabase extends FloorDatabase {
  TableDao get tableDao;

  MenuDao get menuDao;

  OrderDao get orderDao;
}
