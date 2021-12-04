import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Configers/Configers.dart';

class OutBoardingContent1 extends StatelessWidget {
  const OutBoardingContent1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            'Welcome to the  foodes.',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 106.h,
          ),
          Container(
            child: CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage(iconLogo),
            ),
          )
        ],
      ),
    );
  }
}
