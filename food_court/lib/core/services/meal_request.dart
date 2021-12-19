import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/services/http_request.dart';

class JGMealRequest {
  static Future<List<JGMealModel>> getMealData() async {
    // 1.发送网络请求
    final url = "/meal";

    final result = await HttpRequest.request(url);

    // 2.json转modal
    final mealArray = result["meal"];
    List<JGMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(JGMealModel.fromJson(json));
    }
    return meals;
  }
}