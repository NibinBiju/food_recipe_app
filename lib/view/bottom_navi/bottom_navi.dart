import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:recipe_app/constants/color_constants.dart';
import 'package:recipe_app/view/create_recipe_page/create_recipe.dart';
import 'package:recipe_app/view/home_screen/home_screen.dart';
import 'package:recipe_app/view/search_page/search_page.dart';
import 'package:recipe_app/view/settings/settings_page.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int _currentIndex = 0;
  final List _mainPages = [
    HomeScreen(),
    const SearchPage(),
    const CreateRecipePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _mainPages[_currentIndex],
        bottomNavigationBar: Container(
          color: Constants.primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 13,
            ),
            child: GNav(
              padding: EdgeInsets.all(16),
              gap: 8,
              backgroundColor: Constants.primaryColor,
              tabBackgroundColor: Constants.buttonColor,
              rippleColor: Colors.black,
              color: Colors.grey.shade300,
              activeColor: Colors.white,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.plusSquare,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (value) {
                _currentIndex = value;
                setState(() {});
              },
            ),
          ),
        ));
  }
}
