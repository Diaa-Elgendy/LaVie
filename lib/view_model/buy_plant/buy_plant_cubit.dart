import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view_model/dio_network/dio_helper.dart';
import 'package:meta/meta.dart';

import '../dio_network/dio_exceptions.dart';

part 'buy_plant_state.dart';

class BuyPlantCubit extends Cubit<BuyPlantState> {
  BuyPlantCubit() : super(BuyPlantInitial());

  static BuyPlantCubit get(context) => BlocProvider.of(context);

  //Todo: Implement ClaimFreeSeeds
  // Future buyPlant(){
  //   return await DioHelper.postData(endPoint: endPoint)
  // }
}
