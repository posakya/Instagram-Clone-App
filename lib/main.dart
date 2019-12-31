import 'package:flutter/material.dart';
import 'package:food_app/home/comment_list.dart';
import 'package:food_app/home/mainactivity.dart';

import './camera/camera_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Exercise',
      theme: ThemeData(),
      home: MainPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPageView extends StatelessWidget {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      controller: controller,
      children: <Widget>[
        CameraPage(controller: this.controller),
        MainActivity(
          controller: this.controller,
        ),
        Comments(controller: this.controller),
      ],
    );
  }
}