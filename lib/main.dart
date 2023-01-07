import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:weather/views/home_page.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          LocalJsonLocalization.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: Icons.sunny,
            nextScreen: HomePage(title: 'title'.i18n()),
            centered: true,
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: Colors.blue));
  }
}
