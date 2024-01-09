import 'package:flutter/material.dart';
import 'package:front/screen/discover_page.dart';
import 'package:front/screen/home_screen.dart';
import 'package:front/screen/search_screen.dart';
import 'package:front/widget/bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  static const String id = 'navigation_screen';

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              HomeScreen(),
              SearchScreen(),
              DiscoverScreen(),
              Container(
                child: const Center(
                  child: Text('Profile'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Bottom_Tab(onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
        ));
  }
}
