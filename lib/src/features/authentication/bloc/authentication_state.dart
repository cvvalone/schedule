part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  UserEntity get user => when<UserEntity>(
        authenticated: (user) => user,
        inProgress: (user) => user,
        error: (user, _) => user,
        notAuthenticated: (user) => user,
        success: (user) => user,
      );

  bool get inProgress => maybeMap(
        orElse: () => true,
        authenticated: (_) => false,
        notAuthenticated: (_) => false,
      );

  bool get isAuthenticated => user.isAuthenticated;

  AuthenticatedUser? get authenticatedOrNull => maybeMap<AuthenticatedUser?>(
        notAuthenticated: null,
        orElse: () => user.authenticatedOrNull,
      );

  const factory AuthenticationState.authenticated({
    required final UserEntity user,
  }) = _AuthenticatedAuthenticationState;

  const factory AuthenticationState.inProgress({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _InProgressAuthenticationState;

  const factory AuthenticationState.notAuthenticated({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _NotAuthenticatedAuthenticationState;

  const factory AuthenticationState.error(
      {@Default(UserEntity.notAuthenticated()) final UserEntity user,
      @Default('Сталась помилка') String message}) = _ErrorAuthenticationState;

  const factory AuthenticationState.success(
          {@Default(UserEntity.notAuthenticated()) final UserEntity user}) =
      _SuccessAuthenticationState;
}
