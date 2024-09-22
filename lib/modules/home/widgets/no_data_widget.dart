import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/custom_button.dart';
import '../cubit/home_cubit.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nenhum treino disponível ainda!',
                  style: context.textHierarchy.h4,
                ),
                const Text('Contate o Felipe para mais informações!'),
              ],
            ),
          ),
          CustomButton(
            onPressed: context.read<HomeCubit>().getWorkouts,
            icon: Icons.autorenew,
            child: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }
}
