import 'package:flutter/material.dart';

class GLAppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  // 2.普通模式
  static final Color norTextColor = Color(0xff333333);
  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    splashColor: Colors.transparent,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: bodyFontSize, color: norTextColor),
      headline1: TextStyle(fontSize: largeFontSize, color: norTextColor),
      headline2: TextStyle(fontSize: normalFontSize, color: norTextColor),
      headline3: TextStyle(fontSize: smallFontSize, color: norTextColor),
    )
  );

  // 3.暗黑模式
  static final Color darkTextColor = Colors.white;
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: bodyFontSize, color: darkTextColor)
    )
  );
}