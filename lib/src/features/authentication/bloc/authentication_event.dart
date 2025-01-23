part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const AuthenticationEvent._();

  const factory AuthenticationEvent.logIn({
    required String login,
    required String password,
  }) = _LogInAuthenticationEvent;
  
  const factory AuthenticationEvent.logInWithGoogle() = _LogInWithGoogleAuthenticationEvent;

  const factory AuthenticationEvent.logOut() = _LogOutAuthenticationEvent;
}