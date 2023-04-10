import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/utility/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomEmptyData extends StatelessWidget {
  const CustomEmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.isEmpty2, package: 'manager'),
          SizedBox(height: 20.h),
          CustomText(
              text: 'عفوا.. لا يوجد بيانات حاليا',
              fontSize: 15.sp),
        ],
      ),
    );
  }
}
