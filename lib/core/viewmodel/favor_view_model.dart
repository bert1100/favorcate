import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/base_view_model.dart';

class GLFavorViewModel extends GLBaseMealViewModel {

  void addMeal(GLMealModel meal) {
    originalMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(GLMealModel meal) {
    originalMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(GLMealModel meal) {
    if(isFavor(meal)){
      removeMeal(meal);
    }else {
      addMeal(meal);
    }
  }

  bool isFavor(GLMealModel meal) {
    return originalMeals.contains(meal);
  }
}