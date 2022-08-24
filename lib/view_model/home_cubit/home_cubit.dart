import 'package:bloc/bloc.dart';
import 'package:la_vie/model/home/product_model.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view_model/dio_network/dio_exceptions.dart';
import 'package:la_vie/view_model/dio_network/end_points.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_helper.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_manager.dart';

import '../dio_network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ProductsModel? productsModel;
  bool isExamAvailable = false;

  void showExam(){
    print('object');
    DateTime currentDate = DateTime.now();
    DateTime lastDate = CacheHelper.getData(CacheManager.lastDateExam);
    print(CacheHelper.getData(CacheManager.lastDateExam) ?? 'null');
    print(currentDate.difference(lastDate).inDays);
    if(currentDate.difference(lastDate).inDays < 7){
      isExamAvailable = false;
    }
    else{
      isExamAvailable = true;
    }
    emit(ShowExamChanged());
  }

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

}
