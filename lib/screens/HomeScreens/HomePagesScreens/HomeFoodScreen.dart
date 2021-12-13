import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:store_app/models/categories.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'CatigoriesTabBar/EmbityCategory/EmbityCategory.dart';
import 'HomeScreenWigets/SearchHomeScreen.dart';
import 'HomeScreenWigets/categories_container.dart';
import 'HomeScreenWigets/famous_container.dart';
import 'HomeScreenWigets/latest_container.dart';
import 'HomeScreenWigets/swiper_box_container.dart';

class HomeFoodScreen extends StatefulWidget {
  const HomeFoodScreen({Key? key}) : super(key: key);

  @override
  _HomeFoodScreenState createState() => _HomeFoodScreenState();
}

class _HomeFoodScreenState extends State<HomeFoodScreen> {
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeGetxController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.homeResponse != null) {
          return ListView(

            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              SwiperBoxContainer(controller),
              SizedBox(height: 20.h),
              CategoriesContainer(),
              SizedBox(height: 20.h),
              LatestContainer(),
              SizedBox(height: 20.h),

              FamousContainer(),
            ],
          );
        } else {
          return SearchCategory();
        }
      }
          // builder: (context, snapshot) {
          //   return Container(
          //     padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
          //     child: ListView(
          //       children: [
          //         SizedBox(height: 10.h),
          //         Text(
          //           'Good morning ',
          //           style: TextStyle(
          //             fontSize: 16.sp,
          //             color: Color(0xffB8B8B8),
          //           ),
          //         ),
          //         SizedBox(height: 10.h),
          //         SearchWidget(),
          //         SizedBox(height: 10.h),
          //         CategoriesContainer(),
          //         SizedBox(height: 20.h),
          //
          //
          //         FavoriteContainer(),
          //
          //
          //       ],
          //     ),
          //   );
          // }

          ),
    );
  }
}
