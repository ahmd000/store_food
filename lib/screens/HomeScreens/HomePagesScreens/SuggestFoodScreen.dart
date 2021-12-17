import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'EmbityCategory/EmbityCategory.dart';
import 'EmbityCategory/banner_widget.dart';
import 'EmbityCategory/no_suggest.dart';
import 'HomeScreenWigets/SearchHomeScreen.dart';
import 'HomeScreenWigets/famous_container.dart';
import 'HomeScreenWigets/latest_container.dart';

class SuggestFoodScreen extends StatefulWidget {
  const SuggestFoodScreen({Key? key}) : super(key: key);

  @override
  _SuggestFoodScreenState createState() => _SuggestFoodScreenState();
}

class _SuggestFoodScreenState extends State<SuggestFoodScreen> {
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BannerWidget(),

              LatestContainer(),
              SizedBox(height: 20.h),
              FamousContainer(),
            ],
          );
        } else {
          return NoSuggestWidget();
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
