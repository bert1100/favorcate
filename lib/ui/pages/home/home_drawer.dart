import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/material.dart';

import 'package:favorcate/core/extension/num_extension.dart';

class GLHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.px,
      child: Drawer(
        child: Column(
          children: <Widget>[
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), '进餐', () {
              Navigator.of(context).pop();
            }),
            buildListTile(context, Icon(Icons.settings), '过滤', () {
              Navigator.of(context).pushNamed(GLFilterPage.routeName);
            })
          ],
        )
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.px,
      color: Theme.of(context).accentColor,
      alignment: Alignment(0, 0.5),
      margin: EdgeInsets.only(bottom: 10.px),
      child: Text('开始动手', style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, VoidCallback handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline3,),
      onTap: handler,
    );
  }
}
