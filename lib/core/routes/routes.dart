import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/authentication/cubit/login/login_cubit.dart';
import '../../modules/authentication/cubit/register/register_cubit.dart';
import '../../modules/authentication/login/login_page.dart';
import '../../modules/authentication/register/register_page.dart';
import '../../modules/home/cubit/home_cubit.dart';
import '../../modules/home/home_page.dart';
import '../../modules/settings/cubit/settings_cubit.dart';
import '../../modules/settings/settings_page.dart';
import '../../modules/splash/splash_page.dart';
import '../../repositories/auth_repository/auth_repository.dart';
import '../../repositories/settings_repository/settings_repository.dart';

part 'route_names.dart';

final routes = <String, Widget Function(BuildContext)>{
  SPLASH: (_) => const SplashPage(),
  HOME: (_) => BlocProvider(
        create: (_) => HomeCubit(),
        child: const HomePage(),
      ),
  LOGIN: (_) => BlocProvider(
        create: (context) => LoginCubit(context.read<AuthRepository>()),
        child: const LoginPage(),
      ),
  REGISTER: (_) => BlocProvider(
        create: (context) => RegisterCubit(context.read<AuthRepository>()),
        child: const RegisterPage(),
      ),
  SETTINGS: (_) => BlocProvider(
        create: (context) => SettingsCubit(context.read<SettingsRepository>()),
        child: const SettingsPage(),
      )
};
