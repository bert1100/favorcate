import 'package:favorcate/core/model/category_model.dart';
import 'meal_content.dart';

import 'package:flutter/material.dart';

class GLMealPage extends StatelessWidget {
  static const String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as GLCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: GLMealContent(),
    );
  }
}
