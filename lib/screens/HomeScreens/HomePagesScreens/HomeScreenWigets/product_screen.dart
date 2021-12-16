import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/controllers/home_ap_controller.dart';
import 'package:store_app/models/SubCategories.dart';
import 'package:store_app/models/product_subcategory.dart';
import 'package:store_app/models/products.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.subCategory}) : super(key: key);
  final SubCategory subCategory;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<ProductSubCategory>> _future;
  List<ProductSubCategory> _product = <ProductSubCategory>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().showSubCategoryProduct(widget.subCategory.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategory.nameEn),
      ),
      body: FutureBuilder<List<ProductSubCategory>>(
        future: _future,
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductSubCategory>> snapshot) {
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         ProductScreen(subCategory: snapshot.data![index]),
                          //   ),
                          // );
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
