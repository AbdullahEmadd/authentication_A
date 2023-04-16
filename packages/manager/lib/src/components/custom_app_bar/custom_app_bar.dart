import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/routes.dart';
import '../../utility/app_colors.dart';
import '../../utility/app_fonts.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends PreferredSize {
  final String textAppBar;
  final bool isPageHome ;
  final PreferredSizeWidget? tabBar;

  CustomAppBar({
    super.key,
    required this.textAppBar,
    this.isPageHome = false ,
    this.tabBar,
  }) : super(
          child: Container(),
          preferredSize: Size.fromHeight(90.h),
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leading: IconButton(
            onPressed: () {
              if(isPageHome){
                Scaffold.of(context).openDrawer();
              }else {
                if(Navigator.canPop(context)) {
                  goBack();
                }
              }
            },
            icon: Icon(isPageHome ? Icons.menu : Icons.arrow_back_outlined)),
        title: Center(
          child: CustomText(
              text: textAppBar.toString(),
              color: AppColors.black,
              fontSize: 16.sp,
              fontFamily: AppFonts.fontMedium,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // goToScreen(screenNames: ScreenNames.);
            },
            icon: Icon(
              Icons.notifications_none_rounded,
              size: 24.0.sp,
            ),
          )
        ],
          bottom: tabBar,
      ),
    );
  }
}
