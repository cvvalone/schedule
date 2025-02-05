import 'package:meta/meta.dart';

@immutable
abstract class UserEntity {
  @literal
  const factory UserEntity.notAuthenticated() = NotAuthenticatedUser;

  const factory UserEntity.authenticated({
    required final String uid,
    required final String? displayName,
    required final String? photoUrl,
    required final String? email,
    required final String accessToken,
  }) = AuthenticatedUser;

  bool get isAuthenticated;
  bool get isNotAuthenticated;

  AuthenticatedUser? get authenticatedOrNull;

  T when<T extends Object?>({
    required final T Function(AuthenticatedUser user) authenticated,
    required final T Function() notAuthenticated,
  });
}

@immutable
class NotAuthenticatedUser implements UserEntity {
  @literal
  const NotAuthenticatedUser();

  @override
  get authenticatedOrNull => null;

  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  bool operator ==(Object other) {
    return other is NotAuthenticatedUser;
  }

  @override
  String toString() {
    return 'User not authenticated';
  }

  @override
  int get hashCode => 0;

  @override
  T when<T extends Object?>(
          {required T Function(AuthenticatedUser user) authenticated,
          required T Function() notAuthenticated}) =>
      notAuthenticated();
}

class AuthenticatedUser implements UserEntity {
  const AuthenticatedUser({
    required final this.uid,
    required final this.displayName,
    required final this.photoUrl,
    required final this.email,
    required final this.accessToken,
  });

  @override
  AuthenticatedUser? get authenticatedOrNull =>
      isNotAuthenticated ? null : this;

  @override
  bool get isAuthenticated => !isNotAuthenticated;

  @override
  bool get isNotAuthenticated => uid.isEmpty;

  final String uid;
  final String? displayName;
  final String? photoUrl;
  final String? email;
  final String? accessToken;

  @override
  T when<T extends Object?>({
    required T Function(AuthenticatedUser user) authenticated,
    required T Function() notAuthenticated,
  }) =>
      authenticated(this);

  @override
  String toString() {
    return 'UserEntity('
        'uid: $uid, '
        'displayName: $displayName, '
        'email: $email, '
        'photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(final Object other) {
    return other is AuthenticatedUser && uid == other.uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
