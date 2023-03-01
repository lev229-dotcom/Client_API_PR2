import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/app_env.dart';
import '../../../user.dart';

part 'reg_state.dart';

class RegCubit extends Cubit<RegState> {
  RegCubit(this.dio) : super(InitialState());

  final Dio dio;

  Future<void> signUp(User user) async {
    try {
      var result = await dio.put(AppEnv.auth, data: user);
      var data = User.fromJson(result.data["data"]);

      if (result.statusCode == 200) {
        if (data.token == null) {
          throw DioError(
              requestOptions: RequestOptions(path: ''),
              error: 'При запросе токен не был получен!');
        } else {
          dio.options.headers['Authorization'] = 'Bearer ${data.token}';
        }
      }
      emit(SuccessState());
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }
}
