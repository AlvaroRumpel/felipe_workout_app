import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/widgets.dart';
import '../../../models/workout_model.dart';

class HasDataWidget extends StatelessWidget {
  final List<WorkoutModel> workouts;
  const HasDataWidget({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return Container(
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
                      workout.name.formatted,
                      style: context.textHierarchy.h4,
                    ),
                    const CustomSpace.sp2(),
                    Container(
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainer,
                        borderRadius:
                            BorderRadius.circular(context.borderRadius.s),
                      ),
                      width: context.width,
                      padding: const EdgeInsets.all(4),
                      child: CustomScrollView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverList.separated(
                            itemCount: workout.exercises.length,
                            itemBuilder: (context, index) {
                              final exercise = workout.exercises[index];
                              return Text(
                                exercise.name.formatted,
                                style: context.textHierarchy.body2,
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const CustomSpace.sp1(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const CustomSpace.sp2(),
          ),
        ],
      ),
    );
  }
}
