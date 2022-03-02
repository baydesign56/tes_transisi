import 'package:dio/dio.dart';

class DioServices {
  static int timeOut = 8000;
  static Dio dioServices = Dio(
    BaseOptions(
      sendTimeout: timeOut,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      responseType: ResponseType.plain,
    ),
  );
}
