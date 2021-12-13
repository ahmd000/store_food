import 'package:flutter/material.dart';
import 'package:store_app/api/controllers/home_ap_controller.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/SubCategories.dart';
import 'package:store_app/models/categories.dart';

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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) => Card(
                margin: EdgeInsets.all(10),
                child: Container(
                  child: Text(snapshot.data![index].nameEn),
                ),
              ),
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
