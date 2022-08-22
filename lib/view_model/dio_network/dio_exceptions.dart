import 'package:dio/dio.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/screens/authorize/authorize_screen.dart';
import 'package:la_vie/view/screens/home/home_screen.dart';
import 'package:la_vie/view_model/dio_network/dio_helper.dart';
import '../../view/resources/color_manager.dart';
import '../app/functions.dart';

class Exceptions {
  Exceptions(var error) {
    show(error.toString());
    if (error is DioError) {
      // Connection Timeout
      if (error.type == DioErrorType.connectTimeout) {
        showToast('Connection Timeout', ColorManager.toastError);
      }
      
      // if (error.response!.data['message'].toString() == 'Unauthorized') {
      //   navigateAndFinish(context, AuthorizeScreen());
      // }
      
      //print(dioError.response!.data['message'].toString());

      if (error.response!.data['message'].isNotEmpty) {
        show(error.response!.data['message'].toString());
        showToast('${error.response!.data['message']}', ColorManager.toastError);
      }
    }



  }
}
