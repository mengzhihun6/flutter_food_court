import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';

import 'filter_view_model.dart';


class JGBaseMealViewModel extends ChangeNotifier {

  List<JGMealModel> _meals = [];

  JGFilterViewModel _filterVM;

  void updateFilters(JGFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  List<JGMealModel> get meals {
    //过滤
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<JGMealModel> get originMeals {
    return _meals;
  }

  set meals(List<JGMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}