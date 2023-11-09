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
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                haptic: true,
                rippleColor: Colors.black,

                tabActiveBorder: Border.all(color: Colors.black, width: 1),
                tabBorder: Border.all(color: Colors.grey, width: 1),
                tabShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
                ],
                curve: Curves.easeOutExpo,

                gap: 8,
                color: Colors.grey[800],
                activeColor: Constants.primaryColor,
                iconSize: 32,
                tabBackgroundColor: Constants.buttonColor.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5), // na

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
          ),
        ));
  }
}
