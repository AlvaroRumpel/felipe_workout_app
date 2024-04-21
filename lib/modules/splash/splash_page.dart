import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/assets.dart';
import '../../core/extensions/extensions.dart';
import '../../core/routes/routes.dart';
import '../../cubits/auth/auth_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _positionAnimation;
  late Animation _scaleAnimation;
  var _opacity = 0.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong1,
    );

    final curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    _positionAnimation = Tween<double>(
      begin: 0,
      end: -40,
    ).animate(curve);

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.77,
    ).animate(curve);

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animate();
    });
  }

  Future<void> _animate() async {
    Future.delayed(
      Durations.extralong2,
      () => _animationController.forward().whenComplete(() => _opacity = 1),
    ).whenComplete(
      () => Future.delayed(
        Durations.extralong1,
        () => _redirectToPage(context),
      ),
    );
  }

  void _redirectToPage(BuildContext context) {
    context.read<AuthCubit>().stream.listen(
      (state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, HOME);
          return;
        } else if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(0, _positionAnimation.value),
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Image.asset(
                        LOGO_V,
                        width: context.width * .2,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Durations.long1,
                    opacity: _opacity,
                    curve: Curves.easeIn,
                    child: Hero(
                      tag: 'LOGO',
                      child: Image.asset(
                        LOGO_LETREIRO,
                        width: context.width * .5,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
