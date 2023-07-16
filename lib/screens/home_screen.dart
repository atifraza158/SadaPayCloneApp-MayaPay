import 'package:flutter/material.dart';

import 'package:maya_pay/screens/NavigationBar%20Screen/main_screen.dart';
import 'package:maya_pay/screens/NavigationBar%20Screen/menu_sceen.dart';
import 'package:maya_pay/screens/NavigationBar%20Screen/payments_pop.dart';
import 'package:maya_pay/utils/fonts.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'HomeScreen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MainScreen(),
    PaymentsScreen(),
    MenuScreen(),
  ];

  // void _onTapNavigationBar(int index) {
  //   if (index == 1) {
  //     setState(() {
  //       _showBottomSheet = true;
  //     });
  //   } else {
  //     setState(() {
  //       _currentIndex = index;
  //       _showBottomSheet = false;
  //     });
  //   }
  // }

  void SelectedBottomNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _screens[_currentIndex],

      // Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: SelectedBottomNavBar,
        iconSize: 28,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.lightBlue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Payments"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}
