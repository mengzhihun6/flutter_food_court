import 'package:flutter/material.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/core/viewmodel/favor_view_model.dart';
import 'package:food_court/core/viewmodel/filter_view_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:food_court/ui/shared/app_theme.dart';
import 'package:food_court/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider -> ViewModel/Provider/Consumer(Selector)
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => JGFilterViewModel()),
      ChangeNotifierProxyProvider<JGFilterViewModel, JGMealViewModel>(
        create: (ctx) => JGMealViewModel(),
        update: (ctx, filterVM, mealVM) {
          mealVM.updateFilters(filterVM);
          return mealVM;
        },
      ),
      ChangeNotifierProxyProvider<JGFilterViewModel, JGFavorViewModel>(
        create: (ctx) => JGFavorViewModel(),
        update: (ctx, filterVM, favorVM) {
          favorVM.updateFilters(filterVM);
          return favorVM;
        },
      ),
      // ChangeNotifierProvider(create: (ctx) => JGMealViewModel()),
      // ChangeNotifierProvider(create: (ctx) => JGFavorViewModel()),
    ],
    child: MyApp(),
  ));

  // runApp(ChangeNotifierProvider(
  //   create: (ctx) => JGMealViewModel(),
  //   child: MyApp(),
  // )
  // );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    JGSizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      // 主题
      theme: JGAppTheme.norTheme,
      // 路由
      initialRoute: JGRouter.initialRoute,
      routes: JGRouter.routes,
      onGenerateRoute: JGRouter.generateRoute,
      onUnknownRoute: JGRouter.unknownRoute,
    );
  }
}
