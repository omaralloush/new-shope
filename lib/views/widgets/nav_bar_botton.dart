import 'package:flutter/material.dart';
import 'package:new_shope/views/screens/authentication/register_screen.dart';
import 'package:new_shope/views/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBarBotton {
  static PersistentBottomNavBarItem build(
      BuildContext context, String title, IconData iconData) {
    return PersistentBottomNavBarItem(
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
      // title: title,
      textStyle: const TextStyle(color: Colors.white),
      activeColorPrimary: Colors.white.withOpacity(0.3),
      inactiveColorPrimary: Colors.white,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/home": (context) => const HomeScreen(),
          "/second": (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
