import 'package:dio/dio.dart';
import 'package:flutter_demo/app/flavor.dart';
import 'package:flutter_demo/data/network/interceptor/header_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RequestHeaders {
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String authorization = "Authorization";
  static const String defaultLanguage = "language";
  static const String securedKey = 'secured';
}

@module
abstract class DioFactory {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    int _timeOut = 60 * 1000; // 1 min

    Map<String, String> headers = {
      RequestHeaders.contentType: RequestHeaders.applicationJson,
      RequestHeaders.accept: RequestHeaders.applicationJson,
    };
    dio.options = BaseOptions(
        baseUrl: FlavorConfig.instance!.values.baseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);
    dio.interceptors.addAll([HeaderInterceptor()]);
    if (kReleaseMode) {
      // print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
