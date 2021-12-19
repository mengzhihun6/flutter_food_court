
import 'package:flutter/material.dart';
import 'package:food_court/core/viewmodel/favor_view_model.dart';
import 'package:food_court/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';


class JGFavorContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<JGFavorViewModel>(
        builder: (ctx,favorVM,child){
          if (favorVM.meals.length == 0) {
            return Center(child: Text("未收藏美食"),);
          }

          return ListView.builder(
            itemCount: favorVM.meals.length,
              itemBuilder: (ctx, index) {
                return JGMealItem(favorVM.meals[index]);
              }
          );
        });
  }
}
