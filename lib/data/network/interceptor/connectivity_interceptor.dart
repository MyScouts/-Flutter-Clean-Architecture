import 'package:dio/dio.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/data/network/error_handler.dart';
import 'package:flutter_demo/data/network/network_info.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  final NetworkInfo _networkInfo = getIt<NetworkInfo>();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!(await _networkInfo.isConnected)) {
      throw DataSource.noInternetConnection.getFailure();
    }
    return handler.next(options);
  }
}
