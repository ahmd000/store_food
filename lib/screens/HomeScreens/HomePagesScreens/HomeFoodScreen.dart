import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/CatigoriesTabBar/breakfastView.dart';

import 'CatigoriesTabBar/dinnerView.dart';
import 'CatigoriesTabBar/lunchView.dart';
import 'CatigoriesTabBar/snackView.dart';
import 'CatigoriesTabBar/sweetsView.dart';
import 'HomeScreenWigets/SearchHomeScreen.dart';

class HomeFoodScreen extends StatefulWidget {
  const HomeFoodScreen({Key? key}) : super(key: key);

  @override
  _HomeFoodScreenState createState() => _HomeFoodScreenState();
}

class _HomeFoodScreenState extends State<HomeFoodScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Text(
              'Good morning Ahmad',
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xffB8B8B8),
              ),
            ),
            SizedBox(height: 10.h,),
            SearchWidget(),
            SizedBox(height: 10.h,),
           buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Container buildTabBarView() {
    return Container(
          
           child: Expanded(
             child: Column(
               children: [
                 Container(
                   child: TabBar(
                     labelColor: Colors.black,
                     isScrollable: true,
                     labelStyle: TextStyle(
                         fontSize: 16.sp, fontWeight: FontWeight.w700),
                     unselectedLabelStyle: TextStyle(
                       fontSize: 12.sp,
                     ),
                     indicatorColor: Colors.black,
                     controller: _tabController,
                     indicator: BoxDecoration(
                       color: Color(0xffF2A500),
                       borderRadius: BorderRadius.circular(30),
                     ),
                     tabs: [
                       Tab(
                           child: Text(
                             "Breakfast",
                             textAlign: TextAlign.center,
                           )),
                       Tab(
                           child: Text(
                             "Lunch",
                             // 'Tasks Progress',
                             textAlign: TextAlign.center,
                           )),
                       Tab(
                           child: Text(
                             "Dinner",
                             // 'Tasks Done',
                             textAlign: TextAlign.center,
                           )),
                   Tab(
                           child: Text(
                             "Snack",
                             // 'Tasks Progress',
                             textAlign: TextAlign.center,
                           )),
                       Tab(
                           child: Text(
                             "Sweets",
                             // 'Tasks Done',
                             textAlign: TextAlign.center,
                           )),
                     ],
                   ),
                 ),
                 SizedBox(height: 10.h,),
                 Expanded(
                   child: TabBarView(
                     controller: _tabController,
                     children: [
                       breakfastView(),
                       lunchView(),
                       dinnerView(),
                       snackView(),
                       sweetsView()

                     ],
                   ),
                 ),
               ],
             ),
           ),
         );
  }
}
