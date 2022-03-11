import 'package:dio/dio.dart';

class RequestsServices {
  static Future<Response> post(String url, Map<String, dynamic> data) async {
    try {
      Dio dio =
          new Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 60000));
      var response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response;
      } else {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Response(statusCode: 504, requestOptions: null);
        } else {
          return Response(statusCode: 403, requestOptions: null);
        }
      }
    }
  }

  static Future<Response> postOptions(
      String url, Map<String, dynamic> data, Options options) async {
    try {
      Dio dio = Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 60000));

      var response = await dio.post(url, data: data, options: options);

      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response;
      } else {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Response(statusCode: 504, requestOptions: null);
        } else {
          return Response(statusCode: 403, requestOptions: null);
        }
      }
    }
  }

  static Future<Response> postOptionsWithByteArrayResponse(
      String url, Map<String, dynamic> data, Options options) async {
    try {
      Dio dio =
          new Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 60000));
      options.responseType = ResponseType.bytes;
      var response = await dio.post(url, data: data, options: options);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response;
      } else {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Response(statusCode: 504, requestOptions: null);
        } else {
          return Response(statusCode: 403, requestOptions: null);
        }
      }
    }
  }
}
