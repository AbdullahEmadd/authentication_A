import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../models/categories_model/main_categories_model.dart';
import '../../../../routes/routes.dart';
import '../../../../utility/app_colors.dart';
import '../../../../utility/app_fonts.dart';
import '../../../../utility/app_setting.dart';

class CategoryItem extends StatelessWidget {
  final MainCategoriesModel mainCategoriesModel;
  const CategoryItem({super.key, required this.mainCategoriesModel,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        goToScreen(
            screenNames: ScreenNames.getSubCategoriesForMainCategoryScreen,
            arguments: [mainCategoriesModel.id, mainCategoriesModel.isOptional]);
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                  image: NetworkImage(AppSetting.serviceURL + mainCategoriesModel.logo.toString()),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.6),
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(12.r),
                  bottomEnd: Radius.circular(12.r),
                )
            ),
            child: CustomText(text: mainCategoriesModel.name.toString(),
                textAlign: TextAlign.center,
                maxLines: 1,
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: AppFonts.fontMedium),
          )
        ],
      ),
    );
  }
}
