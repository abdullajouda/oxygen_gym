import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oxygen/services/Localization/app_translations_delegate.dart';
import 'package:oxygen/services/Localization/appliction.dart';
import 'package:oxygen/services/Localization/lang_provider.dart';
import 'package:oxygen/services/shared_perfs_provider.dart';
import 'package:oxygen/views/select_branch.dart';
import 'package:oxygen/views/splash.dart';
import 'package:provider/provider.dart';

import 'models/settings.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LangProvider(),
    ),
    Provider(
      create: (context) => SettingsOperation(),
    ),
    ChangeNotifierProvider(create: (context) => UserFunctions()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;
  LangProvider _langProvider;

  void onLocaleChange(Locale locale) => setState(
      () => _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Oxygen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'TheSans').copyWith(
          pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      )),
      locale: Locale(LangProvider().getLocaleCode()),
      supportedLocales: application.supportedLocales(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _newLocaleDelegate,
      ],
      home: SplashScreen(),
    );
  }

  @override
  void initState() {
    if (!LangProvider().hasLocale()) {
      LangProvider().setLocale(locale: Locales.en);
    }
    application.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(
      newLocale: Locale('en', 'US'),
    );
    _langProvider = LangProvider();
    String code = _langProvider.getLocaleCode();
    _newLocaleDelegate = AppTranslationsDelegate(
      newLocale: Locale(code, code),
    );
    super.initState();
  }
}
