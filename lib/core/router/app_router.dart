import 'package:flutter/material.dart';
import 'package:new_shope/views/screens/authentication/register_screen.dart';
import 'package:new_shope/views/screens/main_wrapper.dart';
import 'package:new_shope/views/screens/splash_screen.dart';
import '../error/exceptions.dart';

//----------------screens------------------------
import '../../views/screens/home_screen.dart';
import '../../views/screens/authentication/login_screen.dart';
//----------------screens------------------------

class AppRouter {
  static const String splashScreen = '/';
  //authentication
  static const String login = '/login';
  static const String register = '/register';

  static const String wrapper = '/wrapper';
  static const String home = '/wrapper/home';
  static const String products = '/wrapper/home';
  static const String cart = '/wrapper/home';
  static const String myAcount = '/wrapper/home';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    debugPrint("New Navigation => ${routeSettings.name}");
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case wrapper:
        return MaterialPageRoute(builder: (_) => MainWrapper());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
