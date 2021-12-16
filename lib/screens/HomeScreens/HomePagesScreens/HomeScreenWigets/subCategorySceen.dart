import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/controllers/home_ap_controller.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/SubCategories.dart';
import 'package:store_app/models/categories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key, required this.categories})
      : super(key: key);
  final Categories categories;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> with Helpers {
  late Future<List<SubCategory>> _future;
  List<SubCategory> _cat = <SubCategory>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().showSubCategory(widget.categories.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categories.nameAr)),
      body: FutureBuilder<List<SubCategory>>(
        future: _future,
        builder:
            (BuildContext context, AsyncSnapshot<List<SubCategory>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {

            // snapshot.data![index].nameEn



            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp , vertical: 16.sp),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

                      maxCrossAxisExtent: 400,
                      mainAxisExtent: 250,
                      childAspectRatio: 250 / 300,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductScreen(subCategory: snapshot.data![index]),
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
                                        snapshot.data![index].imageUrl,
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
                                        snapshot.data![index].nameEn,
                                        style: TextStyle(fontSize: 20.sp),
                                      ),

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
          } else if (snapshot.hasError) {
            return Center(child: Text('NO DaTA: ${snapshot.error.toString()}'));
          } else {
            return Center(child: Text('NO DaTA'));
          }
        },
      ),
    );
  }
}
