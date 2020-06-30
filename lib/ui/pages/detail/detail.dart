import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GLDetailPage extends StatelessWidget {
  static const String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final _meal = ModalRoute.of(context).settings.arguments as GLMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: GLDetailContent(_meal),
      floatingActionButton: Consumer<GLFavorViewModel>(
        builder: (ctx, favorVM, child) {
          // 判断收藏状态
          final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
          final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;

          return FloatingActionButton(
            child: Icon(iconData, color: iconColor,),
            onPressed: () {
              favorVM.handleMeal(_meal);
            }
          );
        },
      ),
    );
  }
}
