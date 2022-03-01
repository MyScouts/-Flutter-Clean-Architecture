import 'package:auto_route/auto_route.dart';
import 'package:flutter_demo/presentation/auth/register_screen.dart';
import 'package:flutter_demo/presentation/login/login_screen.dart';
import 'package:flutter_demo/presentation/splash/splash_screen.dart';
import 'package:flutter_demo/presentation/tabbar/tabbar.dart';

class RouteName {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String tabbar = '/tabbar';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: RouteName.splash),
    AutoRoute(page: LoginScreen, path: RouteName.login),
    AutoRoute(page: RegisterScreen, path: RouteName.register),
    AutoRoute(page: Tabbar, path: RouteName.tabbar),
  ],
)
class $RoutesManager {}
