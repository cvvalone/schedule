import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:schedule/src/data/managers/preference_manager.dart';
import 'package:schedule/src/data/repos/authentication/models/token_response.dart';
import 'package:schedule/src/data/repos/authentication/service/dio_client.dart';


final class RefreshTokenInterceptor extends QueuedInterceptor {
  RefreshTokenInterceptor() {
    _refreshDio
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          requestHeader: kDebugMode,
          responseHeader: kDebugMode,
        ),
      )
      ..interceptors.add(
        RetryInterceptor(
          dio: _refreshDio,
        ),
      );
  }

  late final PreferenceManager _pref = PreferenceManager();
  late final Dio _refreshDio = Dio();

  Future<TokensResponse> _fetchNewToken(
    final String refresh,
    final String access,
  ) async {
    final Response res = await _refreshDio.post(
        '${DioClient.main().getBaseUrl()}/admins/refreshTokens',
        data: <String, String>{"refreshToken": refresh},
        options: Options(headers: {
          "Authorization": access,
        }));
    return TokensResponse.fromJson(res.data['data']);
  }

  @override
  Future<void> onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        final String refreshToken = await _pref.getRefreshToken();
        if (refreshToken.isEmpty) {
          super.onError(err, handler);
          return;
        }

        final String accessToken = await _pref.getAccessToken();

        final String token = "Bearer $accessToken";
        if (token != err.requestOptions.headers["Authorization"]) {
          err.requestOptions.headers["Authorization"] = token;
          final Response response = await _refreshDio.fetch(err.requestOptions);
          handler.resolve(response);
          return;
        }

        final TokensResponse newTokens =
            await _fetchNewToken(refreshToken, token);
        await _pref.setAccessToken(newTokens.accessToken!);
        await _pref.setRefreshToken(newTokens.refreshToken!);

        final RequestOptions options = err.requestOptions
          ..headers["Authorization"] = "Bearer ${newTokens.accessToken}";

        final Response response = await _refreshDio.fetch(options);
        handler.resolve(response);
      } on DioException catch (dioError) {
        super.onError(dioError, handler);
      } on Object catch (e) {
        handler.next(err);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
