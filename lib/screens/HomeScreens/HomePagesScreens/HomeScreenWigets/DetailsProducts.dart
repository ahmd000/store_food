import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:store_app/models/products.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsProduct extends StatefulWidget {
  const DetailsProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  late int quantity = widget.product.quantity;
  late int price = widget.product.price;

  late int quantityPrice = quantity * price;
  late int ratingProduct =widget.product.productRate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nameEn),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8.sp),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 350.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.nameEn,
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.product.price} NIS",
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rate: ${widget.product.productRate}",
                        style: TextStyle(color: Colors.amber, fontSize: 14.sp),
                      ),
                      RatingBar.builder(
                        minRating: 1,
                        initialRating: 4,
                        direction: Axis.horizontal,

                        itemSize: 20.sp,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.favorite ,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 200.h,
                    alignment: AlignmentDirectional.topStart,
                    // heightFactor: 250.h,
                    // alignment: AlignmentDirectional.topStart,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.product.infoEn,
                        style: TextStyle(
                          color: Color(0xff8B8989),
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Divider(
                  height: 5,
                  color: Colors.grey,
                  indent: 30.w,
                  endIndent: 30.w,
                ),
                Divider(
                  height: 5,
                  color: Colors.grey,
                  indent: 60.w,
                  endIndent: 60.w,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quantity >= 1 ? "Quantity: $quantity" : "Quantity: 0",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      quantity <= 0 && quantityPrice == null
                          ? "00 NIS"
                          : "Price: $quantityPrice NIS",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 0 && quantity < 100) {
                          setState(() {
                            quantity++;
                            quantityPrice = quantity * price;
                            print(quantity);
                          });
                        } else {
                          return null;
                        }
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_up_outlined,
                        size: 40.sp,
                        color: Colors.amber,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                            quantityPrice = quantity * price;

                            print(quantity);
                          });
                        } else {
                          return null;
                        }
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 40.sp,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    // elevation: 10,
                    fixedSize: Size(0, 70),
                    alignment: AlignmentDirectional.center,
                    primary: Colors.transparent),
                child: Text(
                  "Add To Order",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
