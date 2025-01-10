import 'package:flutter/widgets.dart';
import 'package:schedule/src/features/app/bloc/app_bloc.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/features/home/widget/home_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
