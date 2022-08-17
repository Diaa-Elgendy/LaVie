part of 'authorize_cubit.dart';

@immutable
abstract class AuthorizeState {}

class AuthorizeInitial extends AuthorizeState {}

class SignupLoading extends AuthorizeState {}
class SignupSuccess extends AuthorizeState {}
class SignFailed extends AuthorizeState {
  var error;

  SignFailed(this.error){
    Exceptions(error);
  }
}

class LoginLoading extends AuthorizeState {}
class LoginSuccess extends AuthorizeState {}
class LoginFailed extends AuthorizeState {
  var error;

  LoginFailed(this.error){
    Exceptions(error);
  }
}
