import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:trading_application/constants/constants.dart';
import 'package:trading_application/screens/home/components/orders.dart';
import 'package:trading_application/screens/home/components/profile.dart';

import 'dashboard.dart';
import 'logout.dart';

class CustomTabBar extends StatefulWidget {
  static final title = 'salomon_bottom_bar';

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              if(_currentIndex == 0)
                Dashboard(),
              if(_currentIndex == 1)
                Orders(),
              if(_currentIndex == 2)
                Profile(),
              if(_currentIndex == 3)
                Logout(),
            ],
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Dashboard
            SalomonBottomBarItem(
              icon: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              selectedColor: Colors.purple,
            ),

            /// Orders
            SalomonBottomBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Orders"),
              selectedColor: Colors.pink,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),

            /// Logout
            SalomonBottomBarItem(
              icon: Icon(Icons.logout),
              title: Text("Logout"),
              selectedColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
