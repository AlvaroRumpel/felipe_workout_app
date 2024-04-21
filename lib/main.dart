import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'cubits/auth/auth_cubit.dart';
import 'repositories/auth_repository/auth_repository.dart';
import 'services/auth_service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FWApp());
}

class FWApp extends StatelessWidget {
  const FWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (_) => AuthServiceImpl(firebaseAuth: FirebaseAuth.instance),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            authService: RepositoryProvider.of<AuthService>(
              context,
              listen: false,
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              RepositoryProvider.of<AuthRepository>(
                context,
                listen: false,
              ),
            ),
          ),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Felipe Workout App',
              theme: state.themeData,
              routes: routes,
              initialRoute: SPLASH,
            );
          },
        ),
      ),
    );
  }
}
