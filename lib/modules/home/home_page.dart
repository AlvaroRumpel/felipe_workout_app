import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/extensions/extensions.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets/widgets.dart';
import '../authentication/cubit/auth/auth_cubit.dart';
import 'cubit/home_cubit.dart';
import 'widgets/has_data_widget.dart';
import 'widgets/no_data_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String get actualDay {
    final date = DateTime.now();

    return toBeginningOfSentenceCase(
      DateFormat('EEEE, d \'de\' MMMM', 'pt_BR').format(date),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () => Navigator.pushNamedAndRemoveUntil(
            context,
            LOGIN,
            (route) => false,
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton.outlined(
              onPressed: () => Navigator.pushNamed(context, SETTINGS),
              icon: const Icon(Icons.settings_outlined),
              color: context.colors.primary,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Column(
                children: [
                  const Text('Dia atual'),
                  Text(actualDay, style: context.textHierarchy.h4),
                ],
              ),
              const CustomSpace.sp4(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const CustomInitial(),
                    loading: () => const CustomLoading(),
                    data: (workouts) => HasDataWidget(workouts: workouts),
                    empty: () => const NoDataWidget(),
                    error: (err) => Text(err),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
