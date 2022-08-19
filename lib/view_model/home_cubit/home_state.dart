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

// class GetPlantLoading extends HomeState {}
// class GetPlantSuccess extends HomeState {}
// class GetPlantFailed extends HomeState {
//   var error;
//
//   GetPlantFailed(this.error){
//     Exceptions(error);
//   }
// }
//
// class GetSeedsLoading extends HomeState {}
// class GetSeedsSuccess extends HomeState {}
// class GetSeedsFailed extends HomeState {
//   var error;
//
//   GetSeedsFailed(this.error){
//     Exceptions(error);
//   }
// }
//
// class GetToolsLoading extends HomeState {}
// class GetToolsSuccess extends HomeState {}
// class GetToolsFailed extends HomeState {
//   var error;
//
//   GetToolsFailed(this.error){
//     Exceptions(error);
//   }
// }


//class HomeScreenSuccess extends HomeState {}

