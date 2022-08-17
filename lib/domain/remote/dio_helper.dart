import 'package:dio/dio.dart';
import '../../presenation/resources/string_manager.dart';

class DioHelper {
  static Dio? dio;
  static String baseUrl = 'https://lavie.orangedigitalcenteregypt.com/api/v1/';

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
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

  static Future<Response> postFile(
      {required String endPoint,
      required FormData data,
      String token = ''}) async {
    dio!.options.headers = {
      'Content-Type': "multipart/form-data",
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
          'Authorization': "Bearer ${StringManager.userToken}",
        };
    return await dio!.get(endPoint);
  }
}
