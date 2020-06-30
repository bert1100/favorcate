import 'base_view_model.dart';
import '../services/meal_request.dart';

class GLMealViewModel extends GLBaseMealViewModel {
  GLMealViewModel(){
    GLMealRequest.getMealData().then((res) {
      meals = res;
    });
  }
}