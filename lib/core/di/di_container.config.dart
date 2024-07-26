// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:restaurant/data/local/database.dart' as _i631;
import 'package:restaurant/data/local/local_module.dart' as _i965;
import 'package:restaurant/data/repositories/menu_repository_impl.dart'
    as _i424;
import 'package:restaurant/data/repositories/order_repository_impl.dart'
    as _i497;
import 'package:restaurant/data/repositories/tables_repository_impl.dart'
    as _i123;
import 'package:restaurant/domain/repositories/menu_repository.dart' as _i833;
import 'package:restaurant/domain/repositories/order_repository.dart' as _i646;
import 'package:restaurant/domain/repositories/tables_repository.dart' as _i419;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dBModule = _$DBModule();
    await gh.singletonAsync<_i631.AppDatabase>(
      () => dBModule.createDatabase(),
      preResolve: true,
      dispose: _i965.closeDatabase,
    );
    gh.singleton<_i646.OrderRepository>(
        () => _i497.OrderRepositoryImpl(gh<_i631.AppDatabase>()));
    gh.singleton<_i833.MenuRepository>(
        () => _i424.MenuRepositoryImpl(gh<_i631.AppDatabase>()));
    gh.singleton<_i419.TablesRepository>(
        () => _i123.TablesRepositoryImpl(gh<_i631.AppDatabase>()));
    return this;
  }
}

class _$DBModule extends _i965.DBModule {}
