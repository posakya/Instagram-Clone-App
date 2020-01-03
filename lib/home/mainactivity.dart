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
import 'package:bottom_personalized_dot_bar/bottom_personalized_dot_bar.dart';

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

  String _itemSelected = 'item-1';
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
//      bottomNavigationBar: FABBottomAppBar(
//        centerItemText: 'Upload',
//        color: Colors.grey,
//        selectedColor: Colors.blue,
//        notchedShape: CircularNotchedRectangle(),
////              currentIndex: _selectedIndex,
//        onTabSelected: _onItemTapped,
//        items: [
//          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
//          FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
//          FABBottomAppBarItem(iconData: Icons.person, text: 'Share'),
//          FABBottomAppBarItem(iconData: Icons.info_outline, text: 'About Us'),
//        ],
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: _buildFab(
//          context),
////            drawer: new Drawer(child: getDrawer()),
      body: Stack(
        children: <Widget>[
      // Your App Home
      BottomPersonalizedDotBar(
      keyItemSelected: _itemSelected,
        doneText: 'Done',
        settingTitleText: 'Your Menu',
        settingSubTitleText: 'Drag and drop options',
        iconSettingColor: const Color(0xFFFFD201),
        buttonDoneColor: const Color(0xFFFFD500),
        settingSubTitleColor: const Color(0xFFFECE02),
        hiddenItems: <BottomPersonalizedDotBarItem>[
          BottomPersonalizedDotBarItem('item-4', icon: Icons.cloud, name: 'Nube', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-5', icon: Icons.access_alarm, name: 'Alarma', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-6', icon: Icons.message, name: 'Mensaje', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-7', icon: Icons.notifications, name: 'Alerta', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-8', icon: Icons.security, name: 'Seguridad', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-9', icon: Icons.help, name: 'Ayuda', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-10', icon: Icons.settings, name: 'Config.', onTap: (itemSelected) { /* event selected */ }),
        ],
        items: <BottomPersonalizedDotBarItem>[
          BottomPersonalizedDotBarItem('item-1', icon: Icons.sentiment_very_satisfied, name: 'Flutter', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-2', icon: Icons.favorite_border, name: 'Favorito', onTap: (itemSelected) { /* event selected */ }),
          BottomPersonalizedDotBarItem('item-3', icon: Icons.face, name: 'Perfil', onTap: (itemSelected) { /* event selected */ }),
        ],
      ),
      ],
    ),
//      Center(
//        child: Center(
//          child: _widgetOptions.elementAt(_selectedIndex),
//        ),
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


