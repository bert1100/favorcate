import 'package:flutter/material.dart';

import 'home_content.dart';

class GLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
        leading: IconButton(
          icon: Icon(Icons.format_list_bulleted),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }
        ),
      ),
      body: GLHomeContent(),
    );
  }
}
