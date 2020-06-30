import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GLFilterViewModel()),
        ChangeNotifierProxyProvider<GLFilterViewModel, GLMealViewModel>(
          create: (ctx) => GLMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            mealVM.updateFilters(filterVM);
            return mealVM;
          }
        ),
        ChangeNotifierProxyProvider<GLFilterViewModel, GLFavorViewModel>(
            create: (ctx) => GLFavorViewModel(),
            update: (ctx, filterVM, favorVM) {
              favorVM.updateFilters(filterVM);
              return favorVM;
            }
        ),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 获取屏幕大小
    GLSizeFit.initialize();

    return MaterialApp(
      title: '爱美食',
      theme: GLAppTheme.norTheme,
      routes: GLRouter.routes,
      initialRoute: GLRouter.initialRoute,
      onGenerateRoute: GLRouter.generateRoute,
      onUnknownRoute: GLRouter.unknownRoute,
    );
  }
}
