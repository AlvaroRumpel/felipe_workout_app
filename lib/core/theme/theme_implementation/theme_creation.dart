import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text_hierarchy/text_hierarchy.dart';

ThemeData createTheme({
  required ColorScheme colorScheme,
  required TextHierarchy textHierarchy,
}) {
  return ThemeData(
    colorScheme: colorScheme,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
        TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
      },
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: textHierarchy.body1,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: textHierarchy.body1,
      ),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
    ),
  );
}
