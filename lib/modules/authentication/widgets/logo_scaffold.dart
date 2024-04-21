import 'package:flutter/material.dart';

import '../../../core/assets.dart';
import '../../../core/extensions/extensions.dart';

class LogoScaffold extends StatelessWidget {
  final Widget form;

  const LogoScaffold({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Hero(
                  tag: 'LOGO',
                  child: Image.asset(
                    LOGO_LETREIRO,
                    height: context.height * .2,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(context.borderRadius.xl),
                      topRight: Radius.circular(context.borderRadius.xl),
                    ),
                    color: context.themeState.colors.surfaceContainerLow,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: form),
            ),
          ],
        ),
      ),
    );
  }
}
