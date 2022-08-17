import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/app/functions.dart';
import 'package:la_vie/data/user_model.dart';
import 'package:la_vie/domain/remote/dio_exceptions.dart';
import 'package:la_vie/domain/remote/dio_helper.dart';
import 'package:la_vie/domain/remote/end_points.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/routes_manager.dart';
import 'package:la_vie/presenation/resources/string_manager.dart';
import 'package:meta/meta.dart';

part 'authorize_state.dart';

class AuthorizeCubit extends Cubit<AuthorizeState> {
  AuthorizeCubit() : super(AuthorizeInitial());

  Future postSignUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    emit(SignupLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.signUp,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    ).then((value) {
      UserModel userModel = UserModel.fromJson(value.data);

      showToast(userModel.message!, ColorManager.toastSuccess);
      emit(SignupSuccess());
    }).catchError((error) {
      emit(SignFailed(error));
    });
  }

  Future postLogin(
      {required String email,
        required String password}) async {
    emit(LoginLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      UserModel userModel = UserModel.fromJson(value.data);
      StringManager.userToken = userModel.data!.accessToken!;
      show("Token: ${StringManager.userToken}");
      emit(LoginSuccess());
    }).catchError((error) {
      emit(LoginFailed(error));
    });
  }
}
