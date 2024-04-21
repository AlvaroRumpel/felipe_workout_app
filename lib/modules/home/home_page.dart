import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/widgets.dart';
import '../../cubits/auth/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: CustomButton(
          onPressed: context.read<AuthCubit>().signOut,
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
