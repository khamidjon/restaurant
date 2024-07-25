import 'package:injectable/injectable.dart';
import 'package:restaurant/data/local/database.dart';

@module
abstract class DBModule {
  @preResolve
  @Singleton(dispose: closeDatabase)
  Future<AppDatabase> createDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  }
}

Future<void> closeDatabase(AppDatabase database) {
  return database.close();
}
