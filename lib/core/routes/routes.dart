import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home/home_cubit.dart';
import '../../cubits/login/login_cubit.dart';
import '../../screens/home/home_page.dart';
import '../../screens/login/login_page.dart';

part 'route_names.dart';

final routes = <String, Widget Function(BuildContext)>{
  HOME: (_) => BlocProvider(
        create: (_) => HomeCubit(),
        child: const HomePage(),
      ),
  LOGIN: (_) => BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginPage(),
      )
};
