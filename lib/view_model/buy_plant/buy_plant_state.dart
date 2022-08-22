part of 'buy_plant_cubit.dart';

@immutable
abstract class BuyPlantState {}

class BuyPlantInitial extends BuyPlantState {}
class BuyPlantLoading extends BuyPlantState {}
class BuyPlantSuccess extends BuyPlantState {}
class BuyPlantFailed extends BuyPlantState {
  var error;

  BuyPlantFailed(this.error){
    Exceptions(error);
  }
}
