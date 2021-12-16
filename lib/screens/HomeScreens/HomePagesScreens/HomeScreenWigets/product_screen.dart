import 'package:flutter/material.dart';
import 'package:store_app/models/SubCategories.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.subCategory}) : super(key: key);
  final SubCategory subCategory;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategory.nameEn),
      ),
      body: Column(
        children: [




        ],
      ),
    );
  }
}
