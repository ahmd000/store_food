import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NoSuggestWidget extends StatefulWidget {
  const NoSuggestWidget({Key? key}) : super(key: key);

  @override
  _NoSuggestWidgetState createState() => _NoSuggestWidgetState();
}

class _NoSuggestWidgetState extends State<NoSuggestWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
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
        ),
      ),
    );
  }
}
