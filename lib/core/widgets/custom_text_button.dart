import 'package:flutter/material.dart';

import '../extensions/extensions.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const StadiumBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: context.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 16,
          ),
          child: Text(
            text,
            style: context.textHierarchy.body1.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
