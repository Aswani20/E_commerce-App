// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce_app/Data/data_sources/auth_remote_data_source_impl.dart';
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Domain/Repositories/data_sources/remote_data_source/auth_remote_data_source.dart';
import '../core/Api/api_manager.dart' as _i123;
import '../Data/Repositories/authRepositoryImpl.dart' as _i158;
import '../Domain/Repositories/Auth/auth_repository_contract.dart' as _i1031;
import '../Domain/Repositories/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i556;
import '../Domain/use_cases/register_use_case.dart' as _i209;
import '../features/ui/auth/register/register_view_model.dart' as _i537;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i123.ApiManager>(() => _i123.ApiManager());
    gh.factory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(apiManager: gh<_i123.ApiManager>()));
    gh.factory<_i1031.AuthRepositoryContract>(() => _i158.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i556.AuthRemoteDataSource>()));
    gh.factory<_i209.RegisterUseCase>(() => _i209.RegisterUseCase(
        authRepositoryContract: gh<_i1031.AuthRepositoryContract>()));
    gh.factory<_i537.RegisterViewModel>(() =>
        _i537.RegisterViewModel(registerUseCase: gh<_i209.RegisterUseCase>()));
    return this;
  }
}
