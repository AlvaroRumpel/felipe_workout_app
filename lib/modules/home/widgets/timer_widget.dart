import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/widgets.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with SingleTickerProviderStateMixin {
  var isTimer = false;
  late AnimationController _controller;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Durations.medium1,
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .65,
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: Durations.medium1,
            transitionBuilder: (child, animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2 * (1 - animation.value),
                        sigmaY: 2 * (1 - animation.value),
                      ),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  );
                },
                child: child,
              );
            },
            child: isTimer
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.outlined(
                        onPressed: () {
                          setState(() {
                            isTimer = !isTimer;
                            if (isTimer) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }
                          });
                        },
                        icon: const Icon(Icons.timer_off_outlined),
                      ),
                      Text(
                        'Tempo',
                        style: context.textHierarchy.body1,
                      ),
                      const SizedBox(width: 48),
                    ],
                  )
                : CustomButton.outlined(
                    onPressed: () {
                      setState(() {
                        isTimer = !isTimer;
                        if (isTimer) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                      });
                    },
                    icon: Icons.timer_outlined,
                    child: const Text('Ativar cronômetro'),
                  ),
          ),
          const CustomSpace.sp2(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(context.borderRadius.l),
            ),
            child: Column(
              children: [
                SizeTransition(
                  sizeFactor: _heightFactor,
                  axisAlignment: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          '00:00:00',
                          style: context.textHierarchy.h2,
                        ),
                        const CustomSpace.sp2(),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.pause_outlined),
                    ),
                    const CustomSpace.sp2(),
                    IconButton.filled(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: context.colors.tertiary,
                        foregroundColor: context.colors.onTertiary,
                      ),
                      icon: const Icon(Icons.play_arrow_outlined),
                    ),
                    const CustomSpace.sp2(),
                    IconButton.filled(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: context.colors.errorContainer,
                        foregroundColor: context.colors.error,
                      ),
                      icon: const Icon(Icons.stop_outlined),
                    ),
                    const CustomSpace.sp2(),
                    IconButton.filled(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: context.colors.onTertiary,
                        foregroundColor: context.colors.tertiary,
                      ),
                      icon: const Icon(Icons.check),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
