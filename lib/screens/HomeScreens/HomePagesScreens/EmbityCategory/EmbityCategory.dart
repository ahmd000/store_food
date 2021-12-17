import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget EmbityCategory() => Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "wait to get best offers for you...",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32.sp, color: Colors.grey,),
        ),        Image(
          image: AssetImage(borderView3),
        )
      ],
    );
Widget SearchCategory() => Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "wait to get best offers for you...",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32.sp, color: Colors.grey,),
        ),
        Image(
          image: AssetImage(borderView3),
        )
      ],
    );
