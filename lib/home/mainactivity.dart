import 'package:flutter/material.dart';
import 'package:food_app/home/create_post.dart';
import 'package:food_app/home/home.dart';
import 'package:food_app/home/profile.dart';
import 'package:food_app/home/search.dart';
import 'package:food_app/home/story.dart';
import '../utils/utils.dart';
import 'fabbutton.dart';
import 'layout.dart';
import 'main_home_list.dart';
import 'notifications.dart';

class MainActivity extends StatefulWidget {
  MainActivity({Key key, this.controller}) : super(key: key);

  final PageController controller;

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    SearchPage(),
//    CreatePostPage(),
    NotificationsPage(),
    ProfilePage()
  ];

//  List<Widget> pages = [
//    HomePage(),
//    SearchPage(),
//    CreatePostPage(),
//    NotificationsPage(),
//    ProfilePage()
//  ];
  BottomNavigationBarItem bottomButtonItem(String image) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        height: 25,
      ),
      title: Container(
        height: 0,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Upload',
        color: Colors.grey,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
//              currentIndex: _selectedIndex,
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Share'),
          FABBottomAppBarItem(iconData: Icons.info_outline, text: 'About Us'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context),
//            drawer: new Drawer(child: getDrawer()),
      body: Center(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
//        items: <BottomNavigationBarItem>[
//          bottomButtonItem("home.png"),
//          bottomButtonItem("search.png"),
//          bottomButtonItem("plus.png"),
//          bottomButtonItem("heart.png"),
//          BottomNavigationBarItem(
//            icon: Utils.getProfileImage(height: 25.0),
//            title: Container(
//              height: 0,
//            ),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
//      ),

//      body: Center(
//        child: _widgetOptions.elementAt(_selectedIndex),
//      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
//          child: FabWithIcons(
//            icons: icons,
//            onIconTapped: _selectedFab,
//          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {
          print("Clicked");
        },
        tooltip: 'Upload',
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[500],
        elevation: 2.0,
      ),
    );
  }
}


