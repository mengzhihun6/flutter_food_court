import 'package:flutter/material.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:food_court/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class JGMealContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as JGCategoryModel;

    return Selector<JGMealViewModel,List<JGMealModel>>(
      // selector: (ctx,mealVM) => mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList(),
      selector: (ctx,mealVM) {
        return mealVM.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev,next) => !ListEquality().equals(prev, next),
      builder: (ctx,meals,child) {
        return ListView.builder(
          itemCount: meals.length,
            itemBuilder: (ctx,index) {
              return JGMealItem(meals[index]);
            }
        );
      },
    );
  }
}





// class JGMealContent extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     final category = ModalRoute.of(context).settings.arguments as JGCategoryModel;
//
//     return Consumer <JGMealViewModel>(
//         builder: (ctx,mealVM,child) {
//           final meals = mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
//
//           return ListView.builder(
//               itemCount: meals.length,
//               itemBuilder: (ctx,index) {
//                 return Text("${meals[index].title}");
//               }
//           );
//         }
//     );
//   }
// }
