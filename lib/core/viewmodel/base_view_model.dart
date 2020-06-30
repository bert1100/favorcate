import 'package:flutter/material.dart';

import '../model/meal_model.dart';
import 'filter_view_model.dart';

class GLBaseMealViewModel extends ChangeNotifier {
  List<GLMealModel> _meals = [];

  GLFilterViewModel _filterVM;

  void updateFilters(GLFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  set meals(List<GLMealModel> value) {
    _meals = value;
    notifyListeners();
  }

  List<GLMealModel> get meals {
    return _meals.where((meal) {
      if(_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if(_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if(_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if(_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<GLMealModel> get originalMeals {
    return _meals;
  }
}