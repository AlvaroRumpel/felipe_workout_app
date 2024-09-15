import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/routes/initial_bindings.dart';
import 'core/routes/routes.dart';
import 'core/theme/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('pt_BR', null);
  runApp(const FWApp());
}

class FWApp extends StatelessWidget {
  const FWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositoriesProviders,
      child: MultiBlocProvider(
        providers: blocProviders,
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
