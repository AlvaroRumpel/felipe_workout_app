import 'package:flutter/material.dart';

import 'custom_space.dart';

class CustomLoading extends StatelessWidget {
  final String text;
  const CustomLoading({
    super.key,
    this.text = 'Estamos carregando seus dados.',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        const CustomSpace.sp4(),
        const CircularProgressIndicator(),
      ],
    );
  }
}
