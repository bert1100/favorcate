import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/extension/num_extension.dart';

import 'package:flutter/material.dart';

class GLDetailContent extends StatelessWidget {
  final GLMealModel _meal;
  GLDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBanner(),
          buildTitle(context, '制作材料'),
          buildMakeMaterial(context),
          buildTitle(context, '步骤'),
          buildMakeSteps(context),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget buildBanner() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  // 制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildContainer(
      context: context,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
                child: Text(_meal.ingredients[index])),
          );
        }
      )
    );
  }

  //  制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildContainer(
      context: context,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.steps.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('#$index')),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
      )
    );
  }
  
  // 标题
  Widget buildTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(title, style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  // 公共容器
  Widget buildContainer({BuildContext context, Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width - 30.px,
      padding: EdgeInsets.all(10.px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.px),
        border: Border.all(color: Colors.grey)
      ),
      child: child,
    );
  }
}
