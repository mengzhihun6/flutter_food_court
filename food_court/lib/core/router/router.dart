import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/detail/detail.dart';
import 'package:food_court/ui/pages/favor/favor.dart';
import 'package:food_court/ui/pages/filter/filter.dart';
import 'package:food_court/ui/pages/main/main.dart';
import 'package:food_court/ui/pages/meal/meal.dart';

class JGRouter {
  static final String initialRoute = JGMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    JGMainScreen.routeName: (ctx) => JGMainScreen(),
    JGMealScreen.routeName: (ctx) => JGMealScreen(),
    JGDetailScreen.routeName: (ctx) => JGDetailScreen(),
    // JGFilterScreen.routeName: (ctx) => JGFilterScreen()
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == JGFilterScreen.routeName) {
      return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) {
            return JGFilterScreen();
          });
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
