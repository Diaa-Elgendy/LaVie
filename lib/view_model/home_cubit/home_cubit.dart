import 'package:bloc/bloc.dart';
import 'package:la_vie/model/home/product_model.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view_model/app/functions.dart';
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

  List<Product> filteredList = [];
  String filter = 'ALL';
  int filterLength = 0;

  List<String> chipsTitle = [
    'All',
    'Plants',
    'Seeds',
    'Tools',
  ];
  List<bool> chipsSelected = [
    true,
    false,
    false,
    false,
  ];

  void showExam(){
    print('object');
    DateTime currentDate = DateTime.now();
    DateTime lastDate;
    try {
      lastDate = CacheHelper.getData(CacheManager.lastDateExam);
    } catch (e) {
      CacheHelper.putData(CacheManager.lastDateExam, DateTime.now());
      lastDate = DateTime.now();
    }
    print("Last Date: $lastDate");
    print("Current Date: $currentDate");
    print('Diff: ${currentDate.difference(lastDate)}');
    if (currentDate.difference(lastDate).inDays > 7) {
      isExamAvailable = false;
      show('nooo');
    } else {
      isExamAvailable = true;
      show('yesss');
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
