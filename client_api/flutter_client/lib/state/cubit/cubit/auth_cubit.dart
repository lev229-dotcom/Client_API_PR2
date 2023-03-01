import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_client/common/app_env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.dio) : super(InitialState());

  final Dio dio;

  Future<void> signIn(User user) async {
    try {
      var result = await dio.post(AppEnv.auth, data: user);
      var data = User.fromJson(result.data["data"]);
      if (result.statusMessage == "OK") {
        if (data.token == null) {
          throw DioError(
              requestOptions: RequestOptions(path: ''),
              error: 'При запросе токен не был получен!');
        } else {
          dio.options.headers['Authorization'] = 'Bearer ${data.token}';
        }
        emit(SuccessState());
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }
}
