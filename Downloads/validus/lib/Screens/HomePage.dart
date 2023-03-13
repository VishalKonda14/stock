import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validus/Screens/ProfilePage.dart';
import 'package:validus/Screens/StocksPage.dart';
import 'package:validus/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    StocksPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('Assets/icons/Stock.png', color: Colors.grey),
            activeIcon: Image.asset(
              'Assets/icons/Stock.png',
              color: buttoncolor,
            ),
            label: 'Stock',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'Assets/icons/profile.png',
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              'Assets/icons/profile.png',
              color: buttoncolor,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: buttoncolor,
        onTap: _onItemTapped,
        backgroundColor: backgroundcolor,
      ),
    );
  }
}
