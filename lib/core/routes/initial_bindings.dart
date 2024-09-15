import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../modules/authentication/cubit/auth/auth_cubit.dart';
import '../../repositories/auth_repository/auth_repository.dart';
import '../../repositories/settings_repository/settings_repository.dart';
import '../../services/auth_service/auth_service.dart';
import '../../services/local_storage/local_storage_service.dart';
import '../theme/cubit/theme_cubit.dart';

List<SingleChildWidget> repositoriesProviders = [
  RepositoryProvider<AuthService>(
    create: (_) => AuthServiceImpl(firebaseAuth: FirebaseAuth.instance)
  ),
  RepositoryProvider<AuthRepository>(
    create: (context) => AuthRepositoryImpl(
      authService: RepositoryProvider.of<AuthService>(context, listen: false),
    ),
  ),
  RepositoryProvider<LocalStorageService>(
    create: (_) => LocalStorageServiceImpl(),
  ),
  RepositoryProvider<SettingsRepository>(
    create: (context) => SettingsRepositoryImpl(
      localStorage:
          RepositoryProvider.of<LocalStorageService>(context, listen: false),
    ),
  ),
];

List<SingleChildWidget> blocProviders = [
  BlocProvider(
    create: (context) => AuthCubit(
      RepositoryProvider.of<AuthRepository>(context, listen: false),
    ),
  ),
  BlocProvider(
    create: (context) => ThemeCubit(
      RepositoryProvider.of<SettingsRepository>(context, listen: false),
    ),
  ),
];
