import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/FavorateFoodScreen.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/HomeFoodScreen.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/OrderFoodScreen.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/ProfileScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'HomePagesScreens/SuggestFoodScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static TextStyle optionStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static List _homeNamesScreens = [
    Text(
      'Foodies',
      style: optionStyle,
    ),
    Text(
      'Suggestion ',
      style: optionStyle,
    ),
    // Text(
    //   'Orders',
    //   style: optionStyle,
    // ),
    Text(
      'Favorite',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  static const List<Widget> _homePageScreens = <Widget>[
    HomeFoodScreen(),
    SuggestFoodScreen(),
  //  OrderFoodScreen(),
    FavoriteFoodScreen(),
    ProfileScreen(),
  ];

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Icon(
          Icons.list_alt_outlined,
          size: 32.sp,
        ),
        title: _homeNamesScreens.elementAt(_page),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        // color: Colors.blueAccent,
        child: _homePageScreens.elementAt(_page),
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
             

              activeColor: Colors.amber.shade600,
              iconSize: 24.sp,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey.shade400,
              color: Colors.amber.shade400,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Foodies',
                ),
                GButton(
                  icon: Icons.shopping_bag,
                  text: 'Suggestion',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _page,
              onTabChange: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}