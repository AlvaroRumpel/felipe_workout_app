import 'package:flutter/material.dart';

import '../../../core/utils/emit_catch.dart';
import '../../../repositories/settings_repository/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends FWCubit<SettingsState> {
  final SettingsRepository _repository;
  SettingsCubit(SettingsRepository repository)
      : _repository = repository,
        super(SettingsInitial()) {
    getThemeMode();
  }

  Future<void> getThemeMode() async {
    emitCatch(
      loading: SettingsLoading(),
      success: () async {
        final themeMode = await _repository.getTheme();
        return SettingsData(themeMode: themeMode);
      },
      error: (e) => SettingsDataWithError(
        themeMode: Brightness.dark,
        message: e.toString(),
      ),
    );
  }

  Future<void> changeThemeMode(Brightness mode) async {
    emitCatch(
      loading:
          SettingsDataLoading(themeMode: (state as SettingsData).themeMode),
      success: () async {
        await _repository.saveTheme(mode);
        return SettingsData(themeMode: mode);
      },
      error: (e) => SettingsDataWithError(
        themeMode: (state as SettingsData).themeMode,
        message: e.toString(),
      ),
    );
  }
}
