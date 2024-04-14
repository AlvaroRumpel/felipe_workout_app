import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/custom_colors.dart';
import '../sizes/custom_border_radius.dart';
import '../sizes/spacing.dart';
import '../text_hierarchy/text_hierarchy.dart';
import '../theme_implementation/theme_implementation.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeTextHierarchy _textHierarchy = ThemeTextHierarchy();
  static final ThemeSpacing _spacing = ThemeSpacing();
  static final ThemeBorderRadius _borderRadius = ThemeBorderRadius();
  static final ThemeColors _themeColors = ThemeColors();

  static ColorScheme _colorScheme = ColorScheme.fromSeed(
    seedColor: _themeColors.seed,
    tertiary: _themeColors.tertiary,
    surface: _themeColors.surface,
    brightness: Brightness.dark,
  );

  static ThemeData _themeData = ThemeData(
    colorScheme: _colorScheme,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _colorScheme.surface,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorScheme.primary,
        foregroundColor: _colorScheme.onPrimary,
        textStyle: _textHierarchy.body1,
      ),
    ),
    useMaterial3: true,
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
    _colorScheme = _colorScheme.copyWith(
      brightness: newBrightness,
    );
    _themeData = _themeData.copyWith(
      colorScheme: _colorScheme,
      brightness: newBrightness,
    );
    var newState = (state as ThemeInitial).copyWith(
      themeData: _themeData,
      brightness: newBrightness,
    );
    emit(newState);
    log('Theme toggled to: ${newBrightness.name}');
  }
}
