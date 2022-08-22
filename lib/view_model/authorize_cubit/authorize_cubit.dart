import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:meta/meta.dart';

import '../../model/auth/user_model.dart';
import '../app/functions.dart';
import '../dio_network/dio_exceptions.dart';
import '../dio_network/dio_helper.dart';
import '../dio_network/end_points.dart';
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
      emit(SignupSuccess(userModel));
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
      print(value.data);
      emit(LoginSuccess(userModel));
    }).catchError((error) {
      emit(LoginFailed(error));
    });
  }

  Future postForgetPassword(
      {required String email}) async {
    emit(ForgetPasswordLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.forgetPassword,
      data: {
        'email': email,
      },
    ).then((value) {
      emit(ForgetPasswordSuccess());
    }).catchError((error) {
      emit(ForgetPasswordFailed(error));
    });
  }

  Future postVerifyOTP(
      {required String email,required String otp}) async {
    emit(VerifyOtpLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.verifyOTP,
      data: {
        'email': email,
        'otp': otp,
      },
    ).then((value) {
      emit(VerifyOtpSuccess());
    }).catchError((error) {
      emit(VerifyOtpFailed(error));
    });
  }

  Future postResetPassword(
      {required String email,required String otp, required String password}) async {
    emit(ResetPasswordLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.verifyOTP,
      data: {
        'email': email,
        'otp': otp,
        'password': password,
      },
    ).then((value) {
      showToast('Password Reset Successfully', ColorManager.toastSuccess);

      emit(ResetPasswordSuccess());
    }).catchError((error) {
      emit(ResetPasswordFailed(error));
    });
  }
}
