part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class SeedsLoading extends HomeState {}
class SeedsSuccess extends HomeState {}
class SeedsFailed extends HomeState {
  var error;

  SeedsFailed(this.error){
    Exceptions(error);
  }
}

class GetPlantLoading extends HomeState {}
class GetPlantSuccess extends HomeState {}
class GetPlantFailed extends HomeState {
  var error;

  GetPlantFailed(this.error){
    Exceptions(error);
  }
}

