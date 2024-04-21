import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../colors/custom_colors.dart';
import '../sizes/custom_border_radius.dart';
import '../sizes/spacing.dart';
import '../text_hierarchy/text_hierarchy.dart';
import '../theme_implementation/theme_implementation.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final TextHierarchy _textHierarchy = ThemeTextHierarchy();
  static final Spacing _spacing = ThemeSpacing();
  static final CustomBorderRadius _borderRadius = ThemeBorderRadius();
  static CustomColors _themeColors = ThemeDarkColors();

  static ThemeData _themeData = createTheme(
    colorScheme: _themeColors.colorScheme,
    textHierarchy: _textHierarchy,
  );

  ThemeCubit()
      : super(
          ThemeInitial(
            themeData: _themeData,
            colors: _themeColors,
            brightness: Brightness.dark,
            borderRadius: _borderRadius,
            spacing: _spacing,
            textHierarchy: _textHierarchy,
          ),
        );

  void toggleTheme() {
    var newBrightness = state.brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    _themeColors = state.brightness == Brightness.dark
        ? ThemeLightColors()
        : ThemeDarkColors();

    _themeData = _themeData.copyWith(
      colorScheme: _themeColors.colorScheme,
      brightness: newBrightness,
    );

    emit(
      (state as ThemeInitial).copyWith(
        themeData: _themeData,
        brightness: newBrightness,
      ),
    );

    log('Theme toggled to: ${newBrightness.name}');
  }
}
