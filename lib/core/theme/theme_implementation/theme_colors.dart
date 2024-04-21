import 'package:flutter/material.dart';

import '../colors/custom_colors.dart';

class ThemeLightColors extends CustomColors {
  ThemeLightColors()
      : super(
          brightness: Brightness.light,
          primary: const Color(0xFFC00005),
          onPrimary: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFFFFDAD5),
          onPrimaryContainer: const Color(0xFF410000),
          secondary: const Color(0xFF775652),
          onSecondary: const Color(0xFFFFFFFF),
          secondaryContainer: const Color(0xFFFFDAD5),
          onSecondaryContainer: const Color(0xFF2C1512),
          tertiary: const Color(0xFF006874),
          onTertiary: const Color(0xFFFFFFFF),
          tertiaryContainer: const Color(0xFF97F0FF),
          onTertiaryContainer: const Color(0xFF001F24),
          error: const Color(0xFFBA1A1A),
          errorContainer: const Color(0xFFFFDAD6),
          onError: const Color(0xFFFFFFFF),
          onErrorContainer: const Color(0xFF410002),
          background: const Color(0xFFFFFBFF),
          onBackground: const Color(0xFF201A19),
          surface: const Color(0xFFFFFBFF),
          onSurface: const Color(0xFF201A19),
          surfaceVariant: const Color(0xFFF5DDDA),
          onSurfaceVariant: const Color(0xFF534341),
          outline: const Color(0xFF857370),
          onInverseSurface: const Color(0xFFFBEEEC),
          inverseSurface: const Color(0xFF362F2E),
          inversePrimary: const Color(0xFFFFB4A9),
          shadow: const Color(0xFF000000),
          surfaceTint: const Color(0xFFC00005),
          outlineVariant: const Color(0xFFD8C2BE),
          scrim: const Color(0xFF000000),
          surfaceContainerLow: const Color(0xFFFFF0EE),
        );
}

class ThemeDarkColors extends CustomColors {
  ThemeDarkColors()
      : super(
          brightness: Brightness.dark,
          primary: const Color(0xFFFFB4A9),
          onPrimary: const Color(0xFF690001),
          primaryContainer: const Color(0xFF930003),
          onPrimaryContainer: const Color(0xFFFFDAD5),
          secondary: const Color(0xFFE7BDB6),
          onSecondary: const Color(0xFF442926),
          secondaryContainer: const Color(0xFF5D3F3B),
          onSecondaryContainer: const Color(0xFFFFDAD5),
          tertiary: const Color(0xFF4FD8EB),
          onTertiary: const Color(0xFF00363D),
          tertiaryContainer: const Color(0xFF004F58),
          onTertiaryContainer: const Color(0xFF97F0FF),
          error: const Color(0xFFFFB4AB),
          errorContainer: const Color(0xFF93000A),
          onError: const Color(0xFF690005),
          onErrorContainer: const Color(0xFFFFDAD6),
          background: const Color(0xFF201A19),
          onBackground: const Color(0xFFEDE0DE),
          surface: const Color(0xFF201A19),
          onSurface: const Color(0xFFEDE0DE),
          surfaceVariant: const Color(0xFF534341),
          onSurfaceVariant: const Color(0xFFD8C2BE),
          outline: const Color(0xFFA08C89),
          onInverseSurface: const Color(0xFF201A19),
          inverseSurface: const Color(0xFFEDE0DE),
          inversePrimary: const Color(0xFFC00005),
          shadow: const Color(0xFF000000),
          surfaceTint: const Color(0xFFFFB4A9),
          outlineVariant: const Color(0xFF534341),
          scrim: const Color(0xFF000000),
          surfaceContainerLow: const Color(0xFF231918),
        );
}
