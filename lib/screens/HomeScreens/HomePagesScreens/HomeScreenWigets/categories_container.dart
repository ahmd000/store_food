import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/categories.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/EmbityCategory/EmbityCategory.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/HomeScreenWigets/subCategorySceen.dart';

class CategoriesContainer extends StatefulWidget {
  const CategoriesContainer({Key? key}) : super(key: key);

  @override
  _categoriesContainerState createState() => _categoriesContainerState();
}

class _categoriesContainerState extends State<CategoriesContainer>
    with Helpers {
  List<Categories> _categories = <Categories>[];
  HomeGetxController homeGetxController = Get.put(HomeGetxController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: backgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [Text("View All"), Icon(Icons.navigate_next)],
                  )),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: GetBuilder<HomeGetxController>(builder: (controller) {
              if (controller.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.homeResponse != null) {
                _categories = controller.homeResponse!.categories;

                return Container(
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          mainAxisExtent: 250,
                          childAspectRatio: 250 / 300,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: _categories.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubCategoryScreen(
                                      categories: _categories[index]),
                                ),
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
                                    image: NetworkImage(
                                        _categories[index].imageUrl),
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
        ],
      ),
    );
  }
}
