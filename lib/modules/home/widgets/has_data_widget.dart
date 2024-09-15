import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/widgets.dart';

class HasDataWidget extends StatelessWidget {
  const HasDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(context.borderRadius.l),
            ),
            width: context.width,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Segunda',
                  style: context.textHierarchy.h4,
                ),
                const CustomSpace.sp2(),
                Container(
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainer,
                    borderRadius: BorderRadius.circular(context.borderRadius.s),
                  ),
                  width: context.width,
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teste',
                        style: context.textHierarchy.body2,
                      ),
                      Text(
                        'Teste',
                        style: context.textHierarchy.body2,
                      ),
                      Text(
                        'Teste',
                        style: context.textHierarchy.body2,
                      ),
                      Text(
                        'Teste',
                        style: context.textHierarchy.body2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
