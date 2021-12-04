
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.w,
      ),
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffF8F8F8)),
      child: InkWell(
        onTap: (){Navigator.pushNamed(context, "/search_screen");},
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Color(0xff8B8989),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              "Search food",
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff8B8989),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
