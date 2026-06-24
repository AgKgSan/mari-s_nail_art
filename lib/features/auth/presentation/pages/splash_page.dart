import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/constants/app_contants.dart';
import 'dart:math';

import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/features/auth/presentation/provider/auth_provider.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          final pref = await SharedPreferences.getInstance();
          final String? token = pref.getString('accessToken');
          final bool isLoggedIn = token != null && token.isNotEmpty;
          if (mounted) {
            if (isLoggedIn) {
              context.read<AuthProvider>().authenticated(true);
            }

            context.go(isLoggedIn ? AppRouter.home : AppRouter.login);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _maxScale(Size size, double baseSize) {
    final diagonal = sqrt(size.width * size.width + size.height * size.height);
    return diagonal / baseSize;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const baseSize = 10.0;
    final maxScale = _maxScale(size, baseSize);

    const double distance = 45;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Initial Center Pink Circle
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 + (_animation.value * maxScale),
                  child: Container(
                    width: baseSize,
                    height: baseSize,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),

            // Logo and Text
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final moveValue = Curves.easeOutBack.transform(
                  ((_controller.value - 0.7) / 0.3).clamp(0.0, 1.0),
                );

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // LOGO (left)
                    Transform.translate(
                      offset: Offset(-distance * moveValue, 0),
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                        width: 180,
                      ),
                    ),

                    // TEXT (right)
                    Transform.translate(
                      offset: Offset(distance * moveValue, 0),
                      child: Opacity(
                        opacity: _controller.value < 0.7 ? 0 : 1,
                        child: Text(
                          AppConstants.shopName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
