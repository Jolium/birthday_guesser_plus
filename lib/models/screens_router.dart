import 'package:flutter/material.dart';

import '../settings/constants.dart';

import '../screens/home.dart';
import '../screens/day.dart';
import '../screens/month.dart';
import '../screens/result.dart';
import '../screens/spinner.dart';
import '../screens/picture.dart';

class ScreensRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(anim),
              child: child,
            );
          },
        );
      case kDayScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DayScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(anim),
              child: child,
            );
          },
        );
      case kMonthScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => MonthScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(anim),
              child: child,
            );
          },
        );
      case kSpinnerScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => SpinnerScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      case kPictureScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => PictureScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      case kResultScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ResultScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(anim),
              child: child,
            );
          },
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DayScreen(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(anim),
              child: child,
            );
          },
        );
    }
  }
}
