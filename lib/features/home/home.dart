import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class Home extends StatelessWidget {
  final Widget child;

  const Home({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex(context),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRouter.bookings);
              break;
            case 1:
              context.go(AppRouter.history);
              break;
            case 2:
              context.go(AppRouter.notifications);
              break;
            case 3:
              context.go(AppRouter.profile);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.notepad),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.clockCounterClockwise),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.bell),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.userCircle),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    print(location);

    if (location.startsWith(AppRouter.history)) return 1;
    if (location.startsWith(AppRouter.notifications)) return 2;
    if (location.startsWith(AppRouter.profile)) return 3;

    return 0; // bookings default
  }
}
