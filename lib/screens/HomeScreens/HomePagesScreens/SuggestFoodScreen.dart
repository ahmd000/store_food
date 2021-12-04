import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Configers/Configers.dart';
import 'HomeScreenWigets/SearchHomeScreen.dart';

class SuggestFoodScreen extends StatefulWidget {
  const SuggestFoodScreen({Key? key}) : super(key: key);

  @override
  _SuggestFoodScreenState createState() => _SuggestFoodScreenState();
}

class _SuggestFoodScreenState extends State<SuggestFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(

          children: [
            SizedBox(
              height: 10.h,
            ),
            SearchWidget(),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Expanded(
                  child: Column(
                children: [
                  Image(
                    image: AssetImage(noSuggestion),
                  ),
                  Text(
                    "Huh! You have no food style ",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Pick from suggestion or you can easly search and create your own. ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff8B8989),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
