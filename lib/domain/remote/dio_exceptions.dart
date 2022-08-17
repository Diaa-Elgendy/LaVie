import 'package:dio/dio.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';

import '../../app/functions.dart';

class Exceptions {
  Exceptions(var error) {
    show(error.toString());
    if (error is DioError) {
      // Connection Timeout
      if (error.type == DioErrorType.connectTimeout) {
        showToast('Connection Timeout', ColorManager.toastError);
      }

      // (token expired)
      // else if (dioError.response!.statusCode == 500) {
      //   showToast('Credits expired, please login again', ColorManager.toastError);
      //   Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
      //   CacheHelper.clearData();
      // }


      //print(dioError.response!.data['message'].toString());

      if (error.response!.data['message'].isNotEmpty) {
        show(error.response!.data['message'][0].toString());
        showToast('${error.response!.data['message'][0]}', ColorManager.toastError);
      }
    }



  }
}
