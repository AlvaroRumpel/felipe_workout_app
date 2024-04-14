import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'core/theme/cubit/theme_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FWApp());
}

class FWApp extends StatelessWidget {
  const FWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themeData,
            routes: routes,
            initialRoute: LOGIN,
          );
        },
      ),
    );
  }
}
