import 'package:flutter/material.dart';

abstract class CustomColors {
  final Brightness brightness;
  final Color primary;
  final Color onPrimary;
  final Color? primaryContainer;
  final Color? onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color? secondaryContainer;
  final Color? onSecondaryContainer;
  final Color? tertiary;
  final Color? onTertiary;
  final Color? tertiaryContainer;
  final Color? onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color? errorContainer;
  final Color? onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color? surfaceVariant;
  final Color? onSurfaceVariant;
  final Color? outline;
  final Color? outlineVariant;
  final Color? shadow;
  final Color? scrim;
  final Color? inverseSurface;
  final Color? onInverseSurface;
  final Color? inversePrimary;
  final Color? surfaceTint;

  final Color surfaceContainerLow;

  CustomColors({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    this.primaryContainer,
    this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    this.secondaryContainer,
    this.onSecondaryContainer,
    this.tertiary,
    this.onTertiary,
    this.tertiaryContainer,
    this.onTertiaryContainer,
    required this.error,
    required this.onError,
    this.errorContainer,
    this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    this.surfaceVariant,
    this.onSurfaceVariant,
    this.outline,
    this.outlineVariant,
    this.shadow,
    this.scrim,
    this.inverseSurface,
    this.onInverseSurface,
    this.inversePrimary,
    this.surfaceTint,
    required this.surfaceContainerLow,
  });

  ColorScheme get colorScheme => ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer ?? Colors.transparent,
        onPrimaryContainer: onPrimaryContainer ?? Colors.transparent,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer ?? Colors.transparent,
        onSecondaryContainer: onSecondaryContainer ?? Colors.transparent,
        tertiary: tertiary ?? Colors.transparent,
        onTertiary: onTertiary ?? Colors.transparent,
        tertiaryContainer: tertiaryContainer ?? Colors.transparent,
        onTertiaryContainer: onTertiaryContainer ?? Colors.transparent,
        error: error,
        onError: onError,
        errorContainer: errorContainer ?? Colors.transparent,
        onErrorContainer: onErrorContainer ?? Colors.transparent,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface,
        surfaceVariant: surfaceVariant ?? Colors.transparent,
        onSurfaceVariant: onSurfaceVariant ?? Colors.transparent,
        outline: outline ?? Colors.transparent,
        shadow: shadow ?? Colors.transparent,
        inverseSurface: inverseSurface ?? Colors.transparent,
        onInverseSurface: onInverseSurface ?? Colors.transparent,
        inversePrimary: inversePrimary ?? Colors.transparent,
        surfaceTint: surfaceTint ?? primary,
      );
}
