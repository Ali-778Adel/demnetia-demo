import 'package:dio/dio.dart';

class AuthenticationDioHelper {
  static Dio? dio;

  static void initAuthDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
    print ('dio is not equall null');
  }

  static Future<Response> sendUserData(
      {required String url,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? token}) async {
    dio!.options.headers = {'lang': lang, 'Authorization': token};
    return dio!.post(url, data: data);
  }
}
