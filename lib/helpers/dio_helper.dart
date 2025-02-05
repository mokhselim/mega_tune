import 'package:dio/dio.dart';

import '../shared/constants.dart';

class DioHelper {
  static const String _url = 'https://50k-radio-stations.p.rapidapi.com/';
  static late final Dio _dio;

  static const Map<String, String> _defaultHeaders = {
    "x-rapidapi-key": apiKey,
    "x-rapidapi-host": "50k-radio-stations.p.rapidapi.com"
  };

  ///Instance
  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _url,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  ///GET Data
  static Future<Response> apiGet({
    required String endPoint,
    bool baseUrl = true,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    if (baseUrl) {
      endPoint = '$_url$endPoint';
    }

    _dio.options.headers = headers ?? _defaultHeaders;
    return await _dio.get(endPoint, queryParameters: query, options: options);
  }

  ///Download
  static Future<Response<dynamic>> download(
      {required String urlPath, required String savePath}) async {
    return await _dio.download(urlPath, savePath);
  }

  ///POST Data
  static Future<Response> apiPost({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    endPoint = '$_url$endPoint';

    _dio.options.headers = headers ?? _defaultHeaders;
    return await _dio.post(endPoint, queryParameters: query, data: body);
  }

  ///Put Data
  static Future<Response> apiPut({
    required String endPoint,
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    endPoint = '$_url$endPoint';

    _dio.options.headers = headers ?? _defaultHeaders;
    return await _dio.put(endPoint, queryParameters: query, data: body);
  }

  ///Patch Data
  static Future<Response> apiPatch({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    endPoint = '$_url$endPoint';

    _dio.options.headers = headers ?? _defaultHeaders;
    return await _dio.patch(endPoint, queryParameters: query, data: body);
  }

  ///Delete Data
  static Future<Response> apiDelete({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    endPoint = '$_url$endPoint';

    _dio.options.headers = headers ?? _defaultHeaders;
    return await _dio.delete(endPoint, queryParameters: query, data: body);
  }
}
