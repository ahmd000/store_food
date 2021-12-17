import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/controllers/favorite_product_controller.dart';
import 'package:store_app/get/favorite_product_getx_controller.dart';
import 'package:store_app/models/favorite_product.dart';

import 'EmbityCategory/no_favourite.dart';

class FavoriteFoodScreen extends StatefulWidget {
  const FavoriteFoodScreen({Key? key}) : super(key: key);

  @override
  _FavoriteFoodScreenState createState() => _FavoriteFoodScreenState();
}

class _FavoriteFoodScreenState extends State<FavoriteFoodScreen> {
  late Future<List<FavoriteProduct>> _future;
  List<FavoriteProduct> _favrite = <FavoriteProduct>[];

  FavoriteProductGetxController _favoriteProductGetxController =
      Get.put(FavoriteProductGetxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FavoriteProductController().showFavoriteProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "List Favorite Items",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              child: FutureBuilder<List<FavoriteProduct>>(
                future: _future,
                builder: (BuildContext context,
                    AsyncSnapshot<List<FavoriteProduct>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    // snapshot.data![index].nameEn

                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.sp),
                              topRight: Radius.circular(30.sp)),
                          color: Colors.amber.shade100,
                        ),
                        height: 655.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.sp, vertical: 16.sp),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            // gridDelegate:
                            //     SliverGridDelegateWithMaxCrossAxisExtent(
                            //   maxCrossAxisExtent: 200,
                            //   mainAxisExtent: 100,
                            //   crossAxisSpacing: 20,
                            // ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         ProductScreen(subCategory: snapshot.data![index]),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.sp,
                                    horizontal: 8.sp,
                                  ),
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  margin: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 50,
                                        backgroundImage: NetworkImage(
                                          snapshot.data![index].imageUrl,
                                        ),
                                        minRadius: 30,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].nameEn,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${snapshot.data![index].price} ₪",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite))
                                    ],
                                  ),
                                ),
                              );
                            })
                        // }
                        );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('NO DaTA: ${snapshot.error.toString()}'));
                  } else {
                    return Center(child: noFavorite());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
