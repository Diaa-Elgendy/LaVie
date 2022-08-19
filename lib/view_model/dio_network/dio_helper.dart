import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20000,
        receiveTimeout: 20000,
      ),
    );
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? data,
      String token = ''}) async {
    dio!.options.headers = {
      'Content-Type': "application/json",
      'Accept': "application/json",
      'Authorization': "Bearer $token",
    };
    return await dio!.post(endPoint, data: data);
  }

  static Future<Response> getData(
      {required String endPoint,
      String? token,
      Map<String, dynamic>? header}) async {
    dio!.options.headers = header ??
        {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token",
        };
    return await dio!.get(endPoint);
  }

  static Future<Response> patchData(
      {required String endPoint,
        String? token,
        Map<String, dynamic>? data,
        Map<String, dynamic>? header}) async {
    dio!.options.headers = header ??
        {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token",
        };
    return await dio!.patch(endPoint, data: data);
  }
}
