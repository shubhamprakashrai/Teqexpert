// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/userdata/data/repository/user_repo_impl.dart' as _i5;
import '../../features/userdata/domain/repository/user_base_repo.dart' as _i4;
import '../../features/userdata/domain/usecase/user_data_usecase.dart' as _i6;
import '../../features/userdata/presention/cubit/user_cubit/user_cubit.dart'
    as _i7;
import '../network/dio_client.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i4.UserBaseRepo>(
        () => _i5.UserGetDataRepoImpl(gh<_i3.Dio>()));
    gh.singleton<_i6.UserdataUseCase>(
        () => _i6.UserdataUseCase(gh<_i4.UserBaseRepo>()));
    gh.factory<_i7.UserCubit>(() => _i7.UserCubit(gh<_i6.UserdataUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i8.NetworkModule {}



