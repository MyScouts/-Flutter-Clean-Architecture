import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_demo/app/app_prefs.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/presentation/base/resources/routes_manager.dart';
import 'package:flutter_demo/presentation/base/resources/strings_manager.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final AppPreferences _appPreferences = getIt<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                _appPreferences.logout();
                AutoRouter.of(context).replaceNamed(RouteName.login);
              },
              child: Text(AppStrings.logout.tr()))),
    );
  }
}
