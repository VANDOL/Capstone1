import 'package:flutter/material.dart';
import 'package:flutter_application_2/firstPage.dart';
import 'package:flutter_application_2/secondPage.dart';
import 'package:flutter_application_2/thirdPage.dart';
import 'package:flutter_application_2/custom_icons.dart';
import 'loading.dart';

class NaviPage extends StatefulWidget {
  @override
  _NaviPageState createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {
  int _selectedIndex = 1;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: '노래',
      icon: Icon(Icons.queue_music_rounded),
    ),
    BottomNavigationBarItem(
      label: '날씨',
      icon: Icon(Icons.wb_sunny_outlined),
    ),
    BottomNavigationBarItem(label: '옷', icon: Icon(CustomIcon.shirt)),
  ];
  List pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
      body: pages[_selectedIndex],
    );
  }
}
