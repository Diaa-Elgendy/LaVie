part of 'authorize_cubit.dart';

@immutable
abstract class AuthorizeState {}

class AuthorizeInitial extends AuthorizeState {}

class SignupLoading extends AuthorizeState {}
class SignupSuccess extends AuthorizeState {
  UserModel userModel;

  SignupSuccess(this.userModel);
}

class SignFailed extends AuthorizeState {
  var error;

  SignFailed(this.error){
    Exceptions(error);
  }
}

class LoginLoading extends AuthorizeState {}
class LoginSuccess extends AuthorizeState {
  UserModel userModel;

  LoginSuccess(this.userModel);
}
class LoginFailed extends AuthorizeState {
  var error;

  LoginFailed(this.error){
    Exceptions(error);
  }
}

class ForgetPasswordLoading extends AuthorizeState {}
class ForgetPasswordSuccess extends AuthorizeState {}
class ForgetPasswordFailed extends AuthorizeState {
  var error;

  ForgetPasswordFailed(this.error){
    Exceptions(error);
  }
}

class VerifyOtpLoading extends AuthorizeState {}
class VerifyOtpSuccess extends AuthorizeState {}
class VerifyOtpFailed extends AuthorizeState {
  var error;

  VerifyOtpFailed(this.error){
    Exceptions(error);
  }
}

class ResetPasswordLoading extends AuthorizeState {}
class ResetPasswordSuccess extends AuthorizeState {}
class ResetPasswordFailed extends AuthorizeState {
  var error;

  ResetPasswordFailed(this.error){
    Exceptions(error);
  }
}
