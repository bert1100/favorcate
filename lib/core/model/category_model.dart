import 'package:flutter/material.dart';

class GLCategoryModel {
  String id;
  String title;
  String color;
  Color finalColor;

  GLCategoryModel({this.id, this.title, this.color});

  GLCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 将color转成十六进制数字
    final colorInt = int.parse(color, radix: 16);
    // 加透明度转成颜色
    finalColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}