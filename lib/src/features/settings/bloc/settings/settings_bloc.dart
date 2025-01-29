import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_event.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(themeMode: ThemeMode.light)) {
    on<SettingsEvent>(
      (event, emit) {
        event.map(toggleTheme: (_) {
          final newTheme = state.themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
          emit(SettingsState(themeMode: newTheme));
        });
      },
    );
  }
}
