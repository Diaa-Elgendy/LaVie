import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/screens/authorize/authorize_screen.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_helper.dart';
import 'package:meta/meta.dart';
import '../../model/auth/user_model.dart';
import '../app/functions.dart';
import '../dio_network/dio_exceptions.dart';
import '../dio_network/dio_helper.dart';
import '../dio_network/end_points.dart';

part 'authorize_state.dart';

class AuthorizeCubit extends Cubit<AuthorizeState> {
  AuthorizeCubit() : super(AuthorizeInitial());

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  //Todo: Continue implementing Facebook Login
  // AccessToken? accessToken;
  //
  // Future<void> signIN() async {
  //   final LoginResult result = await FacebookAuth.i.login();
  //
  //   if (result.status == LoginStatus.success) {
  //     accessToken = result.accessToken;
  //     await FacebookAuth.i.getUserData();
  //
  //     final data = await FacebookAuth.i.getUserData();
  //     show(data);
  //     FacebookModel facebookModel = FacebookModel.fromJson(data);
  //   }
  // }



  Future getGoogleAccount() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    emit(GoogleGetUserData());
  }

  Future postGoogleSignIn(
      {required String email,
      required String id,
      required String pictureUrl,
      required String firstName,
      required String lastName}) async {
    emit(LoginLoading());

    return await DioHelper.postData(
      endPoint: EndPoint.googleLogin,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'id': id,
        'picture': pictureUrl,
      },
    ).then((value) {
      UserModel userModel = UserModel.fromJson(value.data);
      show(value.data);

      emit(LoginSuccess(userModel));
    }).catchError((error) {
      emit(LoginFailed(error));
    });
  }

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

  Future postLogin({required String email, required String password}) async {
    emit(LoginLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      UserModel userModel = UserModel.fromJson(value.data);
      show(value.data);
      emit(LoginSuccess(userModel));
    }).catchError((error) {
      emit(LoginFailed(error));
    });
  }

  Future postForgetPassword({required String email}) async {
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

  Future postVerifyOTP({required String email, required String otp}) async {
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
      {required String email,
      required String otp,
      required String password}) async {
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

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    CacheHelper.clearData();
    navigateAndFinish(context, const AuthorizeScreen());
  }
}
