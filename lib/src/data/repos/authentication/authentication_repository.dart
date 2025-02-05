import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:schedule/src/data/repos/authentication/interceptors/refresh_token_interceptor.dart';
import 'package:schedule/src/data/repos/authentication/interceptors/token_interceptor.dart';
import 'package:schedule/src/data/repos/authentication/models.dart';
import 'package:schedule/src/data/repos/authentication/service/dio_client.dart';

abstract class IAuthenticationRepository {
  Future<AuthenticatedUser> login(
      {required final String login, required final String password});

  Future<void> logInWithGoogle();

  Future<void> logout();
}

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({
    GoogleSignIn? googleSignIn,
  })  : _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _dio = DioClient.main();

  final GoogleSignIn _googleSignIn;
  final DioClient _dio;

  @override
  Future<void> logInWithGoogle() {
    // TODO: implement logInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<AuthenticatedUser> login(
      {required String login, required String password}) async {
    try {} catch (e) {throw Exception();}
    return AuthenticatedUser(uid: 'asd', displayName: 'asd', photoUrl: 'asd', email: 'asdasd@gmai.com', accessToken: 'accesss_Token');
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
