import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50.sp,
                    child: Image(image: AssetImage(profileImage)),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmed Al-Moqayed",
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff8B8989),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Setting Panel ",
                style: TextStyle(
                  color: Color(0xff8B8989),
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              trailing: Icon(Icons.navigate_next),
              title: Text(
                "Location",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            ListTile(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.navigate_next),
              title: Text(
                "Payment",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              trailing: Icon(Icons.navigate_next),
              title: Text(
                "Information",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.security),
              trailing: Icon(Icons.navigate_next),
              title: Text(
                "Security",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 32.h,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Notification ",
                style: TextStyle(
                  color: Color(0xff8B8989),
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ListTile(
              leading: Icon(Icons.description_outlined),
              trailing: Switch(onChanged: (bool value) {

                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },    value: isSwitched,),
              title: Text(
                "Discount",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
