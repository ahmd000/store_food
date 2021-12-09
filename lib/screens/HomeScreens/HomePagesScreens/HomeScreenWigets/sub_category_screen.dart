import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:store_app/models/SubCategories.dart';
import 'package:store_app/models/categories.dart';
import 'package:store_app/screens/HomeScreens/HomePagesScreens/CatigoriesTabBar/EmbityCategory/EmbityCategory.dart';

import 'SearchHomeScreen.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  List<SubCategory> _subCategories = <SubCategory>[];
  HomeGetxController homeGetxController = Get.put(HomeGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('_categories[index].nameEn'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          SearchWidget(),
          SizedBox(height: 10.h),
          // _subCategoriesContainer(),
        ],
      ),
    );
  }



  final List<Map> myProducts =
  List.generate(20, (index) => {"id": index, "name": "Product $index"})
      .toList();

  // Container _subCategoriesContainer() => Container(
  //   child: Expanded(
  //     child: GetBuilder<HomeGetxController>(builder: (controller) {
  //       if (controller.isLoading) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       } else if (controller.homeResponse != null) {
  //         _subCategories = controller.homeResponse!.categories.cast<SubCategory>();
  //
  //         return Container(
  //             child: GridView.builder(
  //                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  //                   maxCrossAxisExtent: 200,
  //                   childAspectRatio: 200 / 250,
  //                   crossAxisSpacing: 20,
  //                   mainAxisSpacing: 20,
  //                 ),
  //                 itemCount: _subCategories.length,
  //                 itemBuilder: (BuildContext ctx, index) {
  //                   return InkWell(
  //                     onTap: () {
  //
  //                     },
  //                     child: Container(
  //                       alignment: Alignment.bottomCenter,
  //                       child: Container(
  //                         alignment: AlignmentDirectional.centerStart,
  //                         height: 80.h,
  //                         width: double.infinity,
  //                         decoration: BoxDecoration(
  //                             color: Colors.white54,
  //                             borderRadius: BorderRadius.only(
  //                               // topLeft: Radius.circular(50),
  //                               bottomRight: Radius.circular(50),
  //                             )),
  //                         child: Column(
  //                           mainAxisAlignment:
  //                           MainAxisAlignment.spaceEvenly,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               _subCategories[index].nameEn,
  //                               style: TextStyle(
  //                                   fontSize: 30.sp, color: Colors.black),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       decoration: BoxDecoration(
  //                           image: DecorationImage(
  //                             // image: AssetImage(productView),
  //                             image:
  //                             NetworkImage(_subCategories[index].imageUrl),
  //                             fit: BoxFit.cover,
  //                           ),
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(50),
  //                             bottomRight: Radius.circular(50),
  //                           )),
  //                     ),
  //                   );
  //                 })
  //           // }
  //         );
  //       } else {
  //         return EmbityCategory();
  //       }
  //     }),
  //   ),
  // );

}
