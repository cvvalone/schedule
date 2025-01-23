import 'package:schedule/src/data/repos/authentication/models.dart';

abstract class IAuthenticationRepository{
  Future<AuthenticatedUser> login({required final String login, required final String password});

  Future<void> logout();
}