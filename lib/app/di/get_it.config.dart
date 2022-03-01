// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/network/dio_factory.dart' as _i14;
import '../../data/network/network_info.dart' as _i7;
import '../../data/network/repository/auth_repository.dart' as _i13;
import '../../data/network/rest_service.dart' as _i11;
import '../../domain/data_source/local_data_source.dart' as _i6;
import '../../domain/data_source/remote_data_source.dart' as _i12;
import '../../presentation/base/resources/routes_manager.gr.dart' as _i8;
import '../app_prefs.dart' as _i10;
import '../validator/auth_validator.dart' as _i3;
import 'get_it.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioFactory = _$DioFactory();
  final utilInjectableModule = _$UtilInjectableModule();
  gh.lazySingleton<_i3.AuthValidator>(() => _i3.AuthValidator());
  gh.lazySingleton<_i4.Dio>(() => dioFactory.dio);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => utilInjectableModule.internetConnectionChecker);
  gh.lazySingleton<_i6.LocalDataSource>(() => _i6.LocalDataSourceImplementer());
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.singleton<_i8.RoutesManager>(utilInjectableModule.appRouter);
  await gh.factoryAsync<_i9.SharedPreferences>(() => utilInjectableModule.prefs,
      preResolve: true);
  gh.singleton<_i10.AppPreferences>(
      _i10.AppPreferences(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i11.AppServiceClient>(
      () => _i11.AppServiceClient(get<_i4.Dio>()));
  gh.lazySingleton<_i12.RemoteDataSource>(
      () => _i12.RemoteDataSourceImplementer(get<_i11.AppServiceClient>()));
  gh.lazySingleton<_i13.AuthRepository>(() => _i13.AuthRepositoryImpl(
      get<_i12.RemoteDataSource>(), get<_i7.NetworkInfo>()));
  return get;
}

class _$DioFactory extends _i14.DioFactory {}

class _$UtilInjectableModule extends _i15.UtilInjectableModule {}
