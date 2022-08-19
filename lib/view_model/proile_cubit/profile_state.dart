part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetCurrentUserLoading extends ProfileState {}
class GetCurrentUserSuccess extends ProfileState {}
class GetCurrentUserFailed extends ProfileState {
  var error;

  GetCurrentUserFailed(this.error){
    Exceptions(error);
  }
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {}

class UpdateProfileFailed extends ProfileState {
  var error;

  UpdateProfileFailed(this.error) {
    Exceptions(error);
  }
}
