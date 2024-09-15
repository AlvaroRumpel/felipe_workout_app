part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsData extends SettingsState {
  final Brightness themeMode;

  SettingsData({required this.themeMode});
}

final class SettingsDataLoading extends SettingsLoading {
  final Brightness themeMode;

  SettingsDataLoading({required this.themeMode});
}

final class SettingsDataWithError extends SettingsData {
  final String message;

  SettingsDataWithError({required super.themeMode, required this.message});
}

final class SettingsLoading extends SettingsState {}

final class SettingsError extends SettingsState {
  final String message;

  SettingsError({required this.message});
}
