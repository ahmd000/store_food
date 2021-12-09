import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/api/controllers/home_ap_controller.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:store_app/models/categories.dart';

import 'EmbityCategory/EmbityCategory.dart';

class BreakfastView extends StatefulWidget {
  const BreakfastView({Key? key}) : super(key: key);

  @override
  _BreakfastViewState createState() => _BreakfastViewState();
}

class _BreakfastViewState extends State<BreakfastView> {
  List<Categories> _categories = <Categories>[];
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
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
                        childAspectRatio: 226 / 350,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: _categories.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: AlignmentDirectional.centerStart,
                          height: 100.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _categories[index].nameEn,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              // image: AssetImage(productView),
                              image: NetworkImage(_categories[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15)),
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
}
