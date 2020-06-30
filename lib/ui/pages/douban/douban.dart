import 'package:favorcate/ui/pages/douban/douban_content.dart';
import 'package:flutter/material.dart';

class GLDoubanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('豆瓣电影'),
      ),
      body: GLDoubanContent(),
    );;
  }
}
