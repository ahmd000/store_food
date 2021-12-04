import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class lunchView extends StatefulWidget {
  const lunchView({Key? key}) : super(key: key);

  @override
  _lunchViewState createState() => _lunchViewState();
}

class _lunchViewState extends State<lunchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:GridView.builder(
          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 226 / 350,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: AlignmentDirectional.centerStart,

                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white30 ,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products[index]["name"] ,
                      style: TextStyle(
                          fontSize: 20.sp
                      ),),
                    Text(products[index]["detail"] ,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff8B8989)
                      ),),

                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage(productView),fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            );
          }),
    );
  }

  final List<Map> products =
  List.generate(50, (index) => {"id": index, "name": "Product $index" , "detail":"A delicious egg food from Japan."})
      .toList();

}
