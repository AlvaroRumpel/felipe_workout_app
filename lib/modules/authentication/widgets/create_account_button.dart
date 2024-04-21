import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/routes/routes.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const StadiumBorder(),
      clipBehavior: Clip.hardEdge,
      color: context.themeState.colors.surfaceContainerLow,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, REGISTER),
        child: Container(
          width: context.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 16,
          ),
          child: Text(
            'Criar uma conta aqui',
            style: context.textHierarchy.body1.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
