import 'package:food_court/core/services/meal_request.dart';
import 'package:food_court/core/viewmodel/base_view_model.dart';

class JGMealViewModel extends JGBaseMealViewModel {

  JGMealViewModel() {
    JGMealRequest.getMealData().then((value) {
      meals = value;
    });
  }



}