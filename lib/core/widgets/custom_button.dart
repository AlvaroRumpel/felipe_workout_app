import 'package:flutter/material.dart';

import '../extensions/extensions.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  }) : _type = _CustomButtonType.filled;

  const CustomButton.outlined({
    super.key,
    required this.onPressed,
    required this.child,
  }) : _type = _CustomButtonType.outlined;

  final _CustomButtonType _type;

  ButtonStyleButton get _button => switch (_type) {
        _CustomButtonType.filled => ElevatedButton(
            onPressed: onPressed,
            child: child,
          ),
        _CustomButtonType.outlined => OutlinedButton(
            onPressed: onPressed,
            child: child,
          ),
      };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: _button,
    );
  }
}

enum _CustomButtonType {
  filled,
  outlined,
}
