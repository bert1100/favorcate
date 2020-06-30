import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GLFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GLFavorViewModel>(
      builder: (ctx, favorVM, child) {
        if(favorVM.meals.length == 0){
          return Center(
            child: Text('暂无收藏', style: Theme.of(ctx).textTheme.headline2,),
          );
        }
        return ListView.builder(
          itemCount: favorVM.meals.length,
          itemBuilder: (ctx, index) {
            return GLMealItem(favorVM.meals[index]);
          }
        );
      }
    );
  }
}
