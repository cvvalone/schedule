import 'package:flutter/widgets.dart';
import 'package:schedule/src/feature/app/bloc/app_bloc.dart';
import 'package:schedule/src/feature/authentication/authertication.dart';
import 'package:schedule/src/feature/home/widget/home_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
