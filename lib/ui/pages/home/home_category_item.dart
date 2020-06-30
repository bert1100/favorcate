import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/extension/num_extension.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';

import 'package:flutter/material.dart';

class GLHomeCategoryItem extends StatelessWidget {
  final GLCategoryModel _category;
  GLHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.finalColor;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.px),
            gradient: LinearGradient(colors: [bgColor.withOpacity(.5), bgColor])
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.display2.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(GLMealPage.routeName, arguments: _category);
      },
    );
  }
}