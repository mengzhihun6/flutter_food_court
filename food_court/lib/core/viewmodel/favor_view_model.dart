
import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/base_view_model.dart';
import 'filter_view_model.dart';

class JGFavorViewModel extends JGBaseMealViewModel {

  void addMeal(JGMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(JGMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(JGMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    }else {
      addMeal(meal);
    }
  }

  bool isFavor(JGMealModel meal) {
    return originMeals.contains(meal);
  }

}