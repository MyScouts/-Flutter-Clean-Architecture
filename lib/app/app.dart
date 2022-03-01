import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/app/app_prefs.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/presentation/base/resources/language_manager.dart';
import 'package:flutter_demo/presentation/base/resources/routes_manager.gr.dart';
import 'package:flutter_demo/presentation/base/resources/theme_manager.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppPreferences _appPreferences = getIt<AppPreferences>();
  final RoutesManager _routesManager = getIt<RoutesManager>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Locale _getLocal(String currentLanguage) {
    if (currentLanguage == LanguageType.english.getValue()) {
      return englishLocal;
    } else {
      return englishLocal;
    }
  }

  @override
  void didChangeDependencies() {
    _appPreferences.getAppLanguage().then((String currentLanguage) {
      context.setLocale(_getLocal(currentLanguage));
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      //color set to transperent or set your own color
    ));
    return MaterialApp.router(
      routerDelegate: _routesManager.delegate(),
      routeInformationParser: _routesManager.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
