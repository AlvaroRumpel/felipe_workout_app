import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../repositories/settings_repository/settings_repository.dart';
import '../colors/custom_colors.dart';
import '../sizes/custom_border_radius.dart';
import '../sizes/spacing.dart';
import '../text_hierarchy/text_hierarchy.dart';
import '../theme_implementation/theme_implementation.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SettingsRepository _settingRepository;

  static final TextHierarchy _textHierarchy = ThemeTextHierarchy();
  static final Spacing _spacing = ThemeSpacing();
  static final CustomBorderRadius _borderRadius = ThemeBorderRadius();
  static CustomColors _themeColors = ThemeDarkColors();

  static ThemeData _themeData = createTheme(
    colorScheme: _themeColors.colorScheme,
    textHierarchy: _textHierarchy,
  );

  ThemeCubit(SettingsRepository settingRepository)
      : _settingRepository = settingRepository,
        super(
          ThemeDark(
            themeData: _themeData,
            colors: _themeColors,
            borderRadius: _borderRadius,
            spacing: _spacing,
            textHierarchy: _textHierarchy,
          ),
        ) {
    _setTheme();
  }

  Future<void> _setTheme() async {
    final brightness = await _settingRepository.getTheme();

    _themeColors =
        brightness == Brightness.light ? ThemeLightColors() : ThemeDarkColors();

    _themeData = createTheme(
      colorScheme: _themeColors.colorScheme,
      textHierarchy: _textHierarchy,
    );

    if (brightness == Brightness.light) {
      emit(
        ThemeLight(
          themeData: _themeData,
          colors: _themeColors,
          borderRadius: _borderRadius,
          spacing: _spacing,
          textHierarchy: _textHierarchy,
        ),
      );
    } else {
      emit(
        ThemeDark(
          themeData: _themeData,
          colors: _themeColors,
          borderRadius: _borderRadius,
          spacing: _spacing,
          textHierarchy: _textHierarchy,
        ),
      );
    }

    log('Theme toggled to: ${brightness.name}');
  }

  void toggleTheme(Brightness newBrightness) {
    _themeColors = newBrightness == Brightness.light
        ? ThemeLightColors()
        : ThemeDarkColors();

    _themeData = createTheme(
      colorScheme: _themeColors.colorScheme,
      textHierarchy: _textHierarchy,
    );

    if (newBrightness == Brightness.light) {
      emit(
        ThemeLight(
          themeData: _themeData,
          colors: _themeColors,
          borderRadius: _borderRadius,
          spacing: _spacing,
          textHierarchy: _textHierarchy,
        ),
      );
    } else {
      emit(
        ThemeDark(
          themeData: _themeData,
          colors: _themeColors,
          borderRadius: _borderRadius,
          spacing: _spacing,
          textHierarchy: _textHierarchy,
        ),
      );
    }

    log('Theme toggled to: ${newBrightness.name}');
  }
}
