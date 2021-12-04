import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/FavorateFoodScreen.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/HomeFoodScreen.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/OrderFoodScreen.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/ProfileScreen.dart';

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
    Text(
      'Orders',
      style: optionStyle,
    ),
    Text(
      'Favorate',
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
    OrderFoodScreen(),
    FavorateFoodScreen(),
    ProfileScreen(),
  ];

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0.h,
        items: <Widget>[
          Icon(
            Icons.food_bank,
            size: 30.sp,
            color: Colors.white70,
          ),
          Icon(
            Icons.add_to_photos_outlined,
            size: 30.sp,
            color: Colors.white70,
          ),
          Icon(
            Icons.shopping_bag,
            size: 30.sp,
            color: Colors.white70,
          ),
          Icon(
            Icons.favorite_outlined,
            size: 30.sp,
            color: Colors.white70,
          ),
          Icon(
            Icons.person_pin,
            size: 30.sp,
            color: Colors.white70,
          ),
        ],
        color: Colors.amberAccent,
        buttonBackgroundColor: Colors.amber,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 800),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
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
    );
  }
}
