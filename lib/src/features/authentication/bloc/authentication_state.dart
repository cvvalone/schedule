part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState.authenticated({
    required final UserEntity user,
    @Default('Успішний вхід') String message,
  }) = _AuthenticatedAuthenticationState;

  const factory AuthenticationState.inProgress({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _InProgressAuthenticationState;

  const factory AuthenticationState.notAuthenticated({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _NotAuthenticatedAuthenticationState;

  const factory AuthenticationState.error() = _ErrorAuthenticationState;

  AuthenticatedUser? get authenticatedOrNull => maybeMap<AuthenticatedUser?>(
        authenticated: (state) => state.authenticatedOrNull,
        orElse: () => this.authenticatedOrNull,
        notAuthenticated: (_) => null,
      );

  bool get inProgress => maybeMap<bool>(
        inProgress: (_) => true,
        orElse: () => false,
      );
}
