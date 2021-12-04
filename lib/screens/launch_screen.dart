import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Configers/Configers.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(splashBackground),),
          color: backgroundColor,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 214.h,
            ),
            CircleAvatar(
              radius: 70.sp,
              child: Image(
                image: AssetImage(
                  logoImage,
                ),
                fit: BoxFit.contain,
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              "Foodes App",
              style: TextStyle(
                fontSize: 32.sp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
