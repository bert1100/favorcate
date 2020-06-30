import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/core/extension/num_extension.dart';
import 'package:provider/provider.dart';

class GLFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTitle(context),
        buildChoiceList()
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text('展示你的选择', style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildChoiceList() {
    return Expanded(
      child: Consumer<GLFilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            children: <Widget>[
              buildChoiceItem('无谷蛋白', '展示无谷蛋白食物', filterVM.isGlutenFree, (value) {
                filterVM.isGlutenFree = value;
              }),
              buildChoiceItem('不含乳糖', '展示不含乳糖食物', filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildChoiceItem('普通素食者', '展示普通素食相关食物', filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildChoiceItem('严格素食者', '展示严格素食相关食物', filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        }
      )
    );
  }

  Widget buildChoiceItem(String title, String subtitle, bool value, Function onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: CupertinoSwitch(value: value, onChanged: onChange),
    );
  }
}
