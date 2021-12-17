import 'package:flutter/material.dart';
import 'package:video_app/screens/add_video_screen.dart';
import 'package:video_app/screens/discover_screen.dart';
import 'package:video_app/screens/home_screen.dart';
import 'package:video_app/screens/inbox_screen.dart';
import 'package:video_app/screens/profile_screen.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    DiscoverScreen(),
    AddVideoScreen(),
    InboxScreen(),
    ProfileScreen()
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedPageIndex: _selectedPageIndex, onIconTap: _onIconTapped),
    );
  }
}
