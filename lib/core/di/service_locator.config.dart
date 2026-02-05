// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatbot/core/di/register_module.dart' as _i99;
import 'package:chatbot/feature/chat/data/data_source/chat_api_data_source.dart'
    as _i285;
import 'package:chatbot/feature/chat/data/data_source/chat_remote_data_source.dart'
    as _i452;
import 'package:chatbot/feature/chat/data/repository/chat_repo_impl.dart'
    as _i1053;
import 'package:chatbot/feature/chat/domain/repository/chat_repo.dart' as _i181;
import 'package:chatbot/feature/chat/domain/send_message_use_case.dart'
    as _i869;
import 'package:chatbot/feature/chat/presentation/cubit/chat_cubit.dart'
    as _i384;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i452.ChatRemoteDataSource>(
      () => _i285.ChatAPIDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i181.ChatRepo>(
      () => _i1053.ChatRepoImpl(gh<_i452.ChatRemoteDataSource>()),
    );
    gh.lazySingleton<_i869.SendMessageUseCase>(
      () => _i869.SendMessageUseCase(gh<_i181.ChatRepo>()),
    );
    gh.factory<_i384.ChatCubit>(
      () => _i384.ChatCubit(gh<_i869.SendMessageUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i99.RegisterModule {}
