import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_client/financialrecord.dart';
import 'package:flutter_client/getmodel.dart';
import 'package:flutter_client/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_client/common/app_env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../user.dart';

import '../../../common/app_env.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.dio) : super(InitialState());

  final Dio dio;

  Future<List<FinancialRecord>> getData(GetModel model) async {
    try {
      var result =
          await dio.get(AppEnv.records, queryParameters: model.asMap());
      List<FinancialRecord> records = <FinancialRecord>[];
      for (var x in result.data["data"]) {
        var data = FinancialRecord.fromJson(x);
        records.add(data);
      }
      emit(SuccessState(records));
      return records;
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
      return List.empty();
    }
  }

  Future<void> deleteData(int type, int id) async {
    try {
      var result = await dio.delete(AppEnv.records,
          queryParameters: <String, dynamic>{"type": type, "id": id});
      if (result.statusCode == 200) {
        emit(SuccessState(List.empty()));
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> updateProfile(User user) async {
    try {
      var result = await dio.post(AppEnv.user, data: user);
      if (result.statusCode == 200) {
        emit(SuccessState(List.empty()));
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> changePassword(String oldpassword, String newpassword) async {
    try {
      var result = await dio.put(AppEnv.user,
          queryParameters: <String, dynamic>{
            "newPassword": newpassword,
            "oldPassword": oldpassword
          });
      if (result.statusCode == 200) {
        emit(SuccessState(List.empty()));
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> updateRecord(FinancialRecord record) async {
    try {
      var result = await dio.put(AppEnv.records, data: record);
      if (result.statusCode == 200) {
        emit(SuccessState(List.empty()));
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> addRecord(FinancialRecord record) async {
    try {
      var result = await dio.post(AppEnv.records, data: record);
      if (result.statusCode == 200) {
        emit(SuccessState(List.empty()));
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
  }
}
