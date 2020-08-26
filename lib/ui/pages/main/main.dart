import 'package:flutter/material.dart';

import '../home/home_drawer.dart';
import 'initialize_items.dart';

class GLMainPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _GLMainPageState createState() => _GLMainPageState();
}

class _GLMainPageState extends State<GLMainPage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GLHomeDrawer(),
      body:
//      IndexedStack(
//        index: _currentIndex,
//        children: pages,
//      ),
        PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: pages,
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,  // 大于等于4个item需要设置此属性
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
