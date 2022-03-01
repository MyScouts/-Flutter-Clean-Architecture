import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_prefs.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/presentation/base/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppPreferences _appPreferences = getIt<AppPreferences>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 500), _goNext);
  }

  _goNext() async {
    final bool isUserLoggedIn = await _appPreferences.isUserLoggedIn();
    if (isUserLoggedIn) {
      AutoRouter.of(context).replaceNamed(RouteName.tabbar);
    } else {
      AutoRouter.of(context).replaceNamed(RouteName.login);
    }
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("FLUTTER DEMO"),
      ),
    );
  }
}
