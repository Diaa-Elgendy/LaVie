import 'package:bloc/bloc.dart';
import 'package:la_vie/data/plant_model.dart';
import 'package:la_vie/domain/remote/dio_helper.dart';
import 'package:la_vie/domain/remote/end_points.dart';
import 'package:meta/meta.dart';

import '../../../../domain/remote/dio_exceptions.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  PlantModel? plantModel;

  Future getPlants() async {
    return await DioHelper.getData(
      endPoint: EndPoint.getPlants,
    ).then((value) {
      plantModel = PlantModel.fromJson(value.data);
      emit(GetPlantSuccess());
    }).catchError((error){
      emit(GetPlantFailed(error));
    });
  }
}
