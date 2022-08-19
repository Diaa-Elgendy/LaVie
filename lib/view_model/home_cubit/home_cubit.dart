import 'package:bloc/bloc.dart';
import 'package:la_vie/model/home/plant_model.dart';
import 'package:la_vie/model/home/product_model.dart';
import 'package:la_vie/model/home/seed_model.dart';
import 'package:la_vie/model/home/tool_model.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view_model/dio_network/dio_exceptions.dart';
import 'package:la_vie/view_model/dio_network/end_points.dart';

import '../dio_network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // PlantModel? plantModel;
  // SeedModel? seedModel;
  // ToolModel? toolModel;
  ProductsModel? productsModel;

  // void getHomeData() {
  //   getPlants().then((value) {
  //     getSeeds().then((value) {
  //       getTools().then((value) {
  //         emit(HomeScreenSuccess() );
  //       });
  //     });
  //   });
  // }

  Future getProducts() async {
    emit(GetProductsLoading());
    return await DioHelper.getData(
            endPoint: EndPoint.getProducts, token: StringManager.userToken)
        .then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      emit(GetProductsSuccess(productsModel!));
    }).catchError((error) {
      emit(GetProductsFailed(error));
    });
  }

// Future getPlants() async {
//   emit(GetPlantLoading());
//   return await DioHelper.getData(
//       endPoint: EndPoint.getPlants, token: StringManager.userToken)
//       .then((value) {
//     plantModel = PlantModel.fromJson(value.data);
//     emit(GetPlantSuccess());
//   }).catchError((error) {
//     emit(GetPlantFailed(error));
//   });
// }
//
// Future getSeeds() async {
//   emit(GetSeedsLoading());
//   return await DioHelper.getData(
//       endPoint: EndPoint.getSeeds, token: StringManager.userToken)
//       .then((value) {
//     seedModel = SeedModel.fromJson(value.data);
//     emit(GetSeedsSuccess());
//   }).catchError((error) {
//     emit(GetSeedsFailed(error));
//   });
// }
//
// Future getTools() async {
//   emit(GetToolsLoading());
//   return await DioHelper.getData(
//       endPoint: EndPoint.getTools, token: StringManager.userToken)
//       .then((value) {
//     toolModel = ToolModel.fromJson(value.data);
//     emit(GetToolsSuccess());
//   }).catchError((error) {
//     emit(GetToolsFailed(error));
//   });
// }
}
