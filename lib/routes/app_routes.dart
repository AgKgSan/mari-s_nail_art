import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/features/auth/presentation/pages/create_new_password.dart';
import 'package:mari_nail_art/features/auth/presentation/pages/forgot_password.dart';

import 'package:mari_nail_art/features/auth/presentation/pages/login_page.dart';
import 'package:mari_nail_art/features/auth/presentation/pages/otp_page.dart';
import 'package:mari_nail_art/features/auth/presentation/pages/splash_page.dart';
import 'package:mari_nail_art/features/auth/presentation/provider/auth_provider.dart';
import 'package:mari_nail_art/features/bookings/presentation/pages/booking.dart';
import 'package:mari_nail_art/features/bookings/presentation/pages/view_details.dart';
import 'package:mari_nail_art/features/bookings/presentation/pages/walk_in_form.dart';
import 'package:mari_nail_art/features/history/presentation/pages/history.dart';
import 'package:mari_nail_art/features/home/home.dart';
import 'package:mari_nail_art/features/notifications/presentation/pages/notification.dart';
import 'package:mari_nail_art/features/profile/presentation/pages/profile.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String login = '/login';
  static const String forgot = '/forgot';
  static const String otp = '/otp';
  static const String viewdetails = '/viewdetails';
  static const String createnewpasswrod = '/createnewpasswrod';
  static const String walkinform = '/walkinform';
  static const String home = '/home';
  static const String bookings = '/home/bookings';
  static const String history = '/home/history';
  static const String notifications = '/home/notifications';
  static const String profile = '/home/profile';

  static GoRouter router(AuthProvider authProvider) => GoRouter(
    initialLocation: splash,

    refreshListenable: authProvider,

    // app_routes.dart
    redirect: (context, state) {
      final location = state.matchedLocation;
      final bool isLoggedIn = authProvider.isAuthenticated;

      const publicRoutes = [login, forgot, otp, createnewpasswrod];
      final isPublicRoute = publicRoutes.contains(location);

      if (isLoggedIn && isPublicRoute) {
        return home;
      }

      if (!isLoggedIn && !isPublicRoute) {
        return login;
      }

      if (!isLoggedIn && isPublicRoute) {
        return null;
      }

      return null;
    },
    routes: [
      /// SPLASH
      GoRoute(path: splash, builder: (context, state) => const SplashPage()),
      GoRoute(
        path: forgot,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: viewdetails,
        builder: (context, state) => const ViewDetails(),
      ),
      GoRoute(path: otp, builder: (context, state) => const OtpPage()),

      GoRoute(
        path: walkinform,
        builder: (context, state) => const WalkInForm(),
      ),
      GoRoute(
        path: createnewpasswrod,
        builder: (context, state) => const CreateNewPassword(),
      ),

      /// LOGIN (animation)
      GoRoute(
        path: login,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const LoginPage(),
            transitionsBuilder: (context, animation, _, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeOut)),
                ),
                child: child,
              );
            },
          );
        },
      ),

      ShellRoute(
        builder: (context, state, currentPage) {
          return Home(child: currentPage);
        },
        routes: [
          // Home
          GoRoute(path: home, builder: (context, state) => const Booking()),

          // Booking TAB
          GoRoute(path: bookings, builder: (context, state) => const Booking()),
          // History TAB
          GoRoute(path: history, builder: (context, state) => const History()),
          // Noti TAB
          GoRoute(
            path: notifications,
            builder: (context, state) => const NotificationPage(),
          ),
          // Pf Tab
          GoRoute(path: profile, builder: (context, state) => const Profile()),
        ],
      ),
    ],
  );
}
