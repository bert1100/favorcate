import 'package:favorcate/core/extension/num_extension.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GLMealItem extends StatelessWidget {
  final GLMealModel _meal;
  GLMealItem(this._meal);

  final cardRadius = 12.px;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: <Widget>[
            buildBaseInfo(context),
            buildOperationInfo()
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(GLDetailPage.routeName, arguments: _meal);
      },
    );
  }

  //  主图
  Widget buildBaseInfo(BuildContext ctx) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cardRadius),
                topRight: Radius.circular(cardRadius)),
            child: Image.network(
              _meal.imageUrl,
              width: double.infinity,
              height: 250.px,
              fit: BoxFit.cover,
            )
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(6.px)),
            child: Text(
              _meal.title,
              style: Theme.of(ctx)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  // 操作栏
  Widget buildOperationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: FlatButton.icon(
            highlightColor: Colors.transparent,
            icon: Icon(Icons.schedule),
            label: Text('${_meal.duration}分钟'),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: FlatButton.icon(
            highlightColor: Colors.transparent,
            icon: Icon(Icons.restaurant),
            label: Text(_meal.complexStr),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: buildFavorButton()
        )
      ],
    );
  }

  Widget buildFavorButton() {
    return Consumer<GLFavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 判断收藏状态
        final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorVM.isFavor(_meal) ? '收藏' : '未收藏';

        return FlatButton.icon(
          icon: Icon(iconData, color: iconColor,),
          label: Text(title, style: TextStyle(color: iconColor),),
          onPressed: () {
            favorVM.handleMeal(_meal);
          },
        );
      }
    );
  }
}