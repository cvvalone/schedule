import 'package:bloc/bloc.dart';
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
    required final AuthenticationRepository repository,
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

  AuthenticationRepository _repository;

  Future<void> _onLogin(_LogInAuthenticationEvent event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationState.inProgress(user: state.user));

      final newUser =
          await _repository.login(login: event.login, password: event.password);

      emit(AuthenticationState.success(user: newUser));
    } on Object catch (e) {
      emit(AuthenticationState.error(user: state.user, message: e.toString()));
      rethrow;
    } finally {
      if (state.user.isAuthenticated) {
        emit(AuthenticationState.authenticated(user: state.user));
      } else {
        emit(AuthenticationState.notAuthenticated());
      }
    }
  }

  Future<void> _onGoogleLogin(_LogInWithGoogleAuthenticationEvent event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationState.inProgress(user: state.user));
      final newUser = await _repository.logInWithGoogle();
      emit(AuthenticationState.success(user: newUser));
    } on Object catch (e) {
      emit(AuthenticationState.error(user: state.user, message: e.toString()));
      rethrow;
    } finally {
      if (state.user.isAuthenticated) {
        emit(AuthenticationState.authenticated(user: state.user));
      } else {
        emit(AuthenticationState.notAuthenticated());
      }
    }
  }

  Future<void> _onLogout(_LogOutAuthenticationEvent event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationState.inProgress(user: state.user));
      _repository.logout();
      emit(AuthenticationState.success(
          user: const UserEntity.notAuthenticated()));
    } on Object catch (e) {
      emit(AuthenticationState.error(message: e.toString(), user: state.user));
      rethrow;
    } finally {
      emit(
        state.user.when(
          authenticated: (user) => AuthenticationState.authenticated(user: user),
          notAuthenticated: () => const AuthenticationState.notAuthenticated(),
        ),
      );
    }
  }
}
