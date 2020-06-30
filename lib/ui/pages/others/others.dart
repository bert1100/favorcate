import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GLOthersPage extends StatefulWidget {
  @override
  _GLOthersPageState createState() => _GLOthersPageState();
}

class _GLOthersPageState extends State<GLOthersPage> {
  File _imageFile;
  int _level = 0;
  static const platform = MethodChannel('gray.com/battery');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('原生交互'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('使用三方库调用原生功能', style: Theme.of(context).textTheme.headline2,),
            RaisedButton(
              child: Text('选择照片'),
              onPressed: pickImage
            ),
            _imageFile == null ? Text('请选择一张照片') : Image.file(_imageFile, height: 300,),
            SizedBox(height: 10,),
            Text('flutter直接调用原生代码', style: Theme.of(context).textTheme.headline2,),
            RaisedButton(
                child: Text('获取电池信息'),
                onPressed: getBatteryInfo
            ),
            Text('当前电量：$_level')
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }

  void getBatteryInfo() async {
    final result = await platform.invokeMethod('getBatteryInfo');
    setState(() {
      _level = result;
    });
  }
}
