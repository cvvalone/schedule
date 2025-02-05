import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:schedule/src/data/managers/preference_manager.dart';


final class TokenInterceptor extends Interceptor {
  late final PreferenceManager _pref = PreferenceManager();

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final Locale? locale = await _pref.getLocale();


    if (locale?.languageCode != null) {
      options.queryParameters['lang'] = locale!.languageCode;
    }

    final String accessToken = await _pref.getAccessToken();
    if (accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
      options.headers['Access-Control-Allow-Origin'] = '*';
    }

    return super.onRequest(options, handler);
  }
}
