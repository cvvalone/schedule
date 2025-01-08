import 'dart:async';
import 'dart:developer' as developer;

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:schedule/src/feature/app/bloc/index.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  AppBloc({required AuthenticationRepository authenticationRepository}) : _authenticationRepository = authenticationRepository,
   super(initialState){
   
    
  }
  
  final AuthenticationRepository _authenticationRepository;
}
