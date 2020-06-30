import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class GLRouter {
  static final initialRoute = GLMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    GLMainPage.routeName: (ctx) => GLMainPage(),
    GLMealPage.routeName: (ctx) => GLMealPage(),
    GLDetailPage.routeName: (ctx) => GLDetailPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    // GLFilterPage需要从底部全屏弹出，所以放到这里管理
    if(settings.name == GLFilterPage.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return GLFilterPage();
        },
        fullscreenDialog: true  // 全屏弹出
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}