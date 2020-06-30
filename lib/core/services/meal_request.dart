import '../model/meal_model.dart';

import 'http_request.dart';

class GLMealRequest {
  static Future<List<GLMealModel>> getMealData() async {
    const url = '/meal';
    final res = await HttpRequest.request(url);

    final mealArr = res['meal'];
    List<GLMealModel> meals = [];
    for(var json in mealArr) {
      meals.add(GLMealModel.fromJson(json));
    }

    return meals;
  }
}