import 'dart:ui';

import '../../core/utils/enums/local_storage_type_enum.dart';
import '../../services/local_storage/local_storage_service.dart';
import './settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final LocalStorageService _localStorage;

  SettingsRepositoryImpl({required LocalStorageService localStorage})
      : _localStorage = localStorage;

  @override
  Future<Brightness> getTheme() async {
    try {
      final themeString = await _localStorage.get(LocalStorageTypeEnum.theme);

      return themeString == Brightness.dark.name
          ? Brightness.dark
          : Brightness.light;
    } catch (e) {
      return Brightness.dark;
    }
  }

  @override
  Future<void> saveTheme(Brightness mode) => _localStorage.save(
        LocalStorageTypeEnum.theme,
        mode.name,
      );
}
