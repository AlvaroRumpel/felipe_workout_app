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
        body: Container(
          width: context.width,
          height: context.height,
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
              BlocSelector<HomeCubit, HomeState, bool>(
                selector: (state) {
                  return state is HomeData;
                },
                builder: (context, state) {
                  return Visibility(
                    visible: state,
                    replacement: const NoDataWidget(),
                    child: const HasDataWidget(),
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
