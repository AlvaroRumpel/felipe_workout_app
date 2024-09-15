import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/custom_button.dart';

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
            onPressed: () {},
            icon: Icons.autorenew,
            child: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }
}
