import 'package:flutter/material.dart';

import 'custom_space.dart';

class CustomInitial extends StatelessWidget {
  const CustomInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Um segundo, já já vamos buscar seus dados'),
        CustomSpace.sp4(),
        CircularProgressIndicator(),
      ],
    );
  }
}
