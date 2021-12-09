import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:store_app/models/categories.dart';

import 'CatigoriesTabBar/EmbityCategory/EmbityCategory.dart';
import 'HomeScreenWigets/SearchHomeScreen.dart';

class HomeFoodScreen extends StatefulWidget {
  const HomeFoodScreen({Key? key}) : super(key: key);

  @override
  _HomeFoodScreenState createState() => _HomeFoodScreenState();
}

class _HomeFoodScreenState extends State<HomeFoodScreen> {
  List<Categories> _categories = <Categories>[];
  HomeGetxController homeGetxController = Get.put(HomeGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              'Good morning ',
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xffB8B8B8),
              ),
            ),
            SizedBox(height: 10.h),
            SearchWidget(),
            SizedBox(height: 10.h),
            categoriesContainer()
          ],
        ),
      ),
    );
  }

  Container categoriesContainer() => Container(
        child: Expanded(
          child: GetBuilder<HomeGetxController>(builder: (controller) {
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.homeResponse != null) {
              _categories = controller.homeResponse!.categories;

              return Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 200 / 250,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: _categories.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(

                              context,
                              '/sub_category_screen',

                            );
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: AlignmentDirectional.centerStart,
                              height: 80.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.only(
                                    // topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _categories[index].nameEn,
                                    style: TextStyle(
                                        fontSize: 30.sp, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  // image: AssetImage(productView),
                                  image:
                                      NetworkImage(_categories[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                          ),
                        );
                      })
                  // }
                  );
            } else {
              return EmbityCategory();
            }
          }),
        ),
      );
}
