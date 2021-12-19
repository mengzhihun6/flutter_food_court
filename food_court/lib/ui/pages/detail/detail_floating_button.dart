import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';

class JGDetailFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as JGMealModel;

    return Consumer<JGFavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 1.判断是否是收藏状态
        final iconData =
            favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;
        return FloatingActionButton(
            child: Icon(
              iconData,
              color: iconColor,
            ),
            onPressed: () {
              favorVM.handleMeal(meal);
            });
      },
    );
  }
}
