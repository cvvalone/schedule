import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../interceptors/refresh_token_interceptor.dart';
import '../interceptors/token_interceptor.dart';

final class DioClient {
  factory DioClient.main() => _instance;

  factory DioClient.v2() => _newInstance;

  DioClient._();

  static const int _timeoutMillis = 30000;

  static final DioClient _instance = DioClient._();
  static final DioClient _newInstance = DioClient._();

  BaseOptions _getBaseOptions({
    required final String baseUrl,
  }) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: _timeoutMillis),
      sendTimeout: const Duration(milliseconds: _timeoutMillis),
      receiveTimeout: const Duration(milliseconds: _timeoutMillis),
    );
  }

  late final Dio _dio = Dio(_getBaseOptions(baseUrl: ""));

  void init(final String baseUrl) {
    updateBaseUrl(baseUrl);

    _dio.interceptors.add(TokenInterceptor());

    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
      ),
    );
    _dio.interceptors.add(RefreshTokenInterceptor());
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }
  }

  String getBaseUrl() {
    return _dio.options.baseUrl;
  }

  void updateBaseUrl(final String value) {
    _dio.options.baseUrl = value;
  }

  static const List<int> _defaultUndefinedErrorCodes = [
    _HttpStatus.internalServerError,
    _HttpStatus.notImplemented,
    _HttpStatus.badGateway,
    _HttpStatus.serviceUnavailable,
  ];

  

}

sealed class _HttpStatus {
  static const int unauthorized = 401;

  // static const int unsupportedMediaType = 415;
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int httpVersionNotSupported = 505;
  static const int networkConnectTimeoutError = 599;
  static const int tooManyRequests = 429;
}
