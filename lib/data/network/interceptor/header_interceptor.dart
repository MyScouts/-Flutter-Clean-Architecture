import 'package:dio/dio.dart';
import 'package:flutter_demo/app/app_prefs.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/data/network/dio_factory.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final _appPreferences = getIt<AppPreferences>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken = await _appPreferences.getAccessToken();
    final String language = await _appPreferences.getAppLanguage();
    options.headers.putIfAbsent(RequestHeaders.defaultLanguage, () => language);
    if (accessToken != null && _isRequestSecured(options)) {
      options.headers
        ..putIfAbsent(RequestHeaders.authorization, () => "Bearer $accessToken")
        ..remove(RequestHeaders.securedKey);
    }
    return handler.next(options);
  }

  bool _isRequestSecured(RequestOptions options) =>
      options.headers.containsKey(RequestHeaders.securedKey);
}
