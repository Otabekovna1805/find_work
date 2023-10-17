
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/service_locator.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme() async {
    if(mode.value == ThemeMode.light) {
      await themeRepository.setMode(ThemeMode.dark);
      mode.value = ThemeMode.dark;
    } else {
      await themeRepository.setMode(ThemeMode.light);
      mode.value = ThemeMode.light;
    }
  }


}
