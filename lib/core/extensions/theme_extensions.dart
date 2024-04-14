import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/cubit/theme_cubit.dart';
import '../theme/sizes/custom_border_radius.dart';
import '../theme/sizes/spacing.dart';
import '../theme/text_hierarchy/text_hierarchy.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  ThemeState get themeState => read<ThemeCubit>().state;
  Spacing get spacing => themeState.spacing;
  CustomBorderRadius get borderRadius => themeState.borderRadius;
  TextHierarchy get textHierarchy => themeState.textHierarchy;
}
