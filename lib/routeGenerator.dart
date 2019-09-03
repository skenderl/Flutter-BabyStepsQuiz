import 'package:flutter/material.dart';
import 'package:quiz_app/ui/Transitions.dart';

import 'package:quiz_app/ui/screens/SplashScreen.dart';
import 'package:quiz_app/ui/screens/IntroScreen.dart';
import 'package:quiz_app/ui/screens/HomeScreen.dart';
import 'package:quiz_app/ui/screens/ProgressScreen.dart';
import 'package:quiz_app/ui/screens/AboutScreen.dart';
import 'package:quiz_app/ui/screens/CategoryMenuScreen.dart';
import 'package:quiz_app/ui/screens/CategoryScreen.dart';
import 'package:quiz_app/ui/screens/ResultScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/Splash':
        return FadeRoute(page:  SplashScreen());
      case '/Intro':
        return FadeRoute(page:  IntroScreen());
      case '/Home':
        return ScaleRoute(page:  HomeScreen());
      case '/MyProgress':
        return FadeRoute(page:  ProgressScreen());
      case '/About':
        return FadeRoute(page:  AboutScreen());
      case '/Menu':
        return FadeRoute(page: CategoryMenuScreen());
      case '/Category':
        return SizeRoute(page: CategoryScreen(category: args));
      case '/Result':
        return ScaleRoute(page: ResultScreen(correct: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
