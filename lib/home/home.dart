import 'package:flutter/material.dart';
import 'package:food_app/home/story.dart';
import 'main_home_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.controller}) : super(key: key);

  final PageController controller;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFFFAFAFA),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
          child: Image.asset("InstagramLogo.png"),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset("direct.png"),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            widget.controller.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Image.asset("camera.png"),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xFFF0F0F0),
                  ),
                ),
              ),
              child: StoriesListView(),
            ),
          ),
          MainHomeList()
        ],
      ),
    );
  }
}
