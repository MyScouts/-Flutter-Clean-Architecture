import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/app/flavor.dart';
import 'package:flutter_demo/presentation/base/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setFlavorDevelopment();
  await initDependencyInjection();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [englishLocal, vietnamLocal],
    path: assetsPathLocalisations,
    fallbackLocale: vietnamLocal,
    child: const App(),
  ));
}
