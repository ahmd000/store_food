import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/get/homeGetxController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ConstrainedBox SwiperBoxContainer(HomeGetxController controller) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: 10.h,
      maxHeight: 200.h,
      minWidth: double.infinity,
    ),
    child: controller.homeResponse!.slider.isNotEmpty
        ? Swiper(
            onTap: (value) {},
            duration: 500,
            autoplay: true,
            itemCount: controller.homeResponse!.slider.length,
            viewportFraction: 0.7,
            scale: 0.8,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: SizedBox(
                          height: 200.h,
                          width: double.infinity,
                          child: Image.network(
                            controller.homeResponse!.slider[index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        : Center(
            child: Image.asset(borderView3),
          ),
  );
}
