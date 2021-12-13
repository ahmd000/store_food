import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/products.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/CatigoriesTabBar/EmbityCategory/EmbityCategory.dart';

import 'DetailsProducts.dart';

class LatestContainer extends StatefulWidget {
  const LatestContainer({Key? key}) : super(key: key);

  @override
  _LatestContainerState createState() => _LatestContainerState();
}

class _LatestContainerState extends State<LatestContainer> with Helpers {
  List<Product> _products = <Product>[];
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
                "Latest Products",
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
            height: 10.h,
          ),
          Expanded(
            child: GetBuilder<HomeGetxController>(builder: (controller) {
              if (controller.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.homeResponse != null) {
                _products = controller.homeResponse!.latestProducts;

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
                        itemCount: _products.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsProduct(product: _products[index]),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 4 / 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            _products[index].imageUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            _products[index].nameEn,
                                            style: TextStyle(fontSize: 20.sp),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "${_products[index].price}   Nis",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                              Text(
                                                "Rate: ${_products[index].overalRate} ",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
