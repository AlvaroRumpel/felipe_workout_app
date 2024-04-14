import 'package:flutter/material.dart';

abstract class CustomColors {
  final Color seed;
  final Color tertiary;
  final Color surface;
  final Color surfaceContainerLow;

  CustomColors({
    required this.seed,
    required this.tertiary,
    required this.surface,
    required this.surfaceContainerLow,
  });
}
