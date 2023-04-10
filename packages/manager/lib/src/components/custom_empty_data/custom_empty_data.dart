import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/utility/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmptyData extends StatelessWidget {
  final String? message ;
  final double? height ;
  const CustomEmptyData({Key? key , this.message , this.height }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.isEmpty2, height: height, package: 'manager'),
          SizedBox(height: 20.h),
          CustomText(
              text: message ?? 'عفوا.. لا يوجد بيانات حاليا',
              fontSize: 15.sp),
        ],
      ),
    );
  }
}
