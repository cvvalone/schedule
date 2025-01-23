import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule/src/data/repos/authentication/models.dart';
import 'package:schedule/src/data/repos/authentication/repository/authentication_repository.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    UserEntity? userEntity,
    required final IAuthenticationRepository repository,
  })  : _repository = repository,
        super(
          userEntity?.when<AuthenticationState>(
                authenticated: (user) =>
                    AuthenticationState.authenticated(user: user),
                notAuthenticated: () => AuthenticationState.notAuthenticated(),
              ) ??
              AuthenticationState.notAuthenticated(),
        ) {
    on<AuthenticationEvent>(
      (event, emit) => event.map<Future<void>>(
        logIn: (event) => _onLogin(event, emit),
        logInWithGoogle: (event) => _onGoogleLogin(event, emit),
        logOut: (event) => _onLogout(event, emit),
      ),
    );
  }

  Future<void> _onLogin(_LogInAuthenticationEvent event,
      Emitter<AuthenticationState> emit) async {
    try {} on Object catch (e) {}
  }

  Future<void> _onGoogleLogin(_LogInWithGoogleAuthenticationEvent event,
      Emitter<AuthenticationState> emit) async {}

  Future<void> _onLogout(_LogOutAuthenticationEvent event,
      Emitter<AuthenticationState> emit) async {}

  IAuthenticationRepository _repository;
}
