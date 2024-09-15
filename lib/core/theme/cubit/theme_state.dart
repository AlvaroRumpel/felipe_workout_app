part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {
  final ThemeData themeData;
  final Brightness brightness;
  final CustomBorderRadius borderRadius;
  final Spacing spacing;
  final TextHierarchy textHierarchy;
  final CustomColors colors;

  const ThemeState({
    required this.themeData,
    required this.brightness,
    required this.borderRadius,
    required this.spacing,
    required this.textHierarchy,
    required this.colors,
  });
}

final class ThemeDark extends ThemeState {
  const ThemeDark({
    required super.themeData,
    required super.borderRadius,
    required super.spacing,
    required super.textHierarchy,
    required super.colors,
  }) : super(brightness: Brightness.dark);

  ThemeDark copyWith({
    ThemeData? themeData,
    CustomBorderRadius? borderRadius,
    Spacing? spacing,
    TextHierarchy? textHierarchy,
    CustomColors? colors,
  }) {
    return ThemeDark(
      themeData: themeData ?? this.themeData,
      borderRadius: borderRadius ?? this.borderRadius,
      spacing: spacing ?? this.spacing,
      textHierarchy: textHierarchy ?? this.textHierarchy,
      colors: colors ?? this.colors,
    );
  }
}

final class ThemeLight extends ThemeState {
  const ThemeLight({
    required super.themeData,
    required super.borderRadius,
    required super.spacing,
    required super.textHierarchy,
    required super.colors,
  }) : super(brightness: Brightness.dark);

  ThemeLight copyWith({
    ThemeData? themeData,
    CustomBorderRadius? borderRadius,
    Spacing? spacing,
    TextHierarchy? textHierarchy,
    CustomColors? colors,
  }) {
    return ThemeLight(
      themeData: themeData ?? this.themeData,
      borderRadius: borderRadius ?? this.borderRadius,
      spacing: spacing ?? this.spacing,
      textHierarchy: textHierarchy ?? this.textHierarchy,
      colors: colors ?? this.colors,
    );
  }
}
