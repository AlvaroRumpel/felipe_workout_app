import 'package:flutter/material.dart';

export 'settings_repository_impl.dart';

abstract interface class SettingsRepository {
  Future<void> saveTheme(Brightness mode);
  Future<Brightness> getTheme();
}
