import 'package:dio/dio.dart';
import 'package:flutter_client/state/cubit/cubit/auth_cubit.dart';
import 'package:flutter_client/state/cubit/cubit/reg_cubit.dart';
import 'package:get_it/get_it.dart';

import 'common/app_env.dart';

final sl = GetIt.instance;

Future<void> init() async {


  Dio dio = Dio(BaseOptions(
      sendTimeout: 15000,
      connectTimeout: 15000,
      receiveTimeout: 15000,
      baseUrl: '${AppEnv.protocol}://${AppEnv.ip}:8888'));
  dio.interceptors.add(Interceptor());

  sl.registerLazySingleton(() => dio);
}
