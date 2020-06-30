import 'package:flutter/material.dart';

import '../favor/favor.dart';
import '../home/home.dart';
import '../douban/douban.dart';
import '../others/others.dart';

final List<Widget> pages = [
  GLHomePage(),
  GLFavorPage(),
  GLDoubanPage(),
  GLOthersPage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      title: Text('首页'),
      icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
      title: Text('收藏'),
      icon: Icon(Icons.star)
  ),
  BottomNavigationBarItem(
    title: Text('豆瓣'),
    icon: Icon(Icons.movie)
  ),
  BottomNavigationBarItem(
    title: Text('其他'),
    icon: Icon(Icons.more)
  )
];