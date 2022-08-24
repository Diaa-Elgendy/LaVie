part of 'home_cubit.dart';

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

class GetProductsLoading extends HomeState {}
class GetProductsSuccess extends HomeState {
  ProductsModel productsModel;

  GetProductsSuccess(this.productsModel);
}
class GetProductsFailed extends HomeState {
  var error;

  GetProductsFailed(this.error){
    Exceptions(error);
  }
}

class ShowExamChanged extends HomeState {}
