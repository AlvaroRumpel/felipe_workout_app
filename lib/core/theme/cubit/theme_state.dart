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

final class ThemeInitial extends ThemeState {
  const ThemeInitial({
    required super.themeData,
    required super.brightness,
    required super.borderRadius,
    required super.spacing,
    required super.textHierarchy,
    required super.colors,
  });

  ThemeInitial copyWith({
    ThemeData? themeData,
    Brightness? brightness,
    CustomBorderRadius? borderRadius,
    Spacing? spacing,
    TextHierarchy? textHierarchy,
    CustomColors? colors,
  }) {
    return ThemeInitial(
      themeData: themeData ?? this.themeData,
      brightness: brightness ?? this.brightness,
      borderRadius: borderRadius ?? this.borderRadius,
      spacing: spacing ?? this.spacing,
      textHierarchy: textHierarchy ?? this.textHierarchy,
      colors: colors ?? this.colors,
    );
  }
}
