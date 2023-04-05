import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/utility/app_colors.dart';

import '../../cubits/select_items_cubit/selectitems_cubit.dart';
import '../../utility/app_fonts.dart';
import '../../utility/app_setting.dart';
import '../custom_text/custom_text.dart';

class SelectItemList extends StatelessWidget {
  final String name;
  final SelectItemsCubit selectItemsCubitTemp;
  final Function onTap;
  final bool enable;

  const SelectItemList({super.key,
      required this.name,
      required this.onTap,
      required this.selectItemsCubitTemp,
      this.enable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(enable){
          onTap(name);
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: enable
                        ? AppColors.fillColor.withOpacity(.4)
                        : AppColors.fillColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, bottom: 16.h, left: 15.w, right: 15.w),
                          child:
                              BlocBuilder<SelectItemsCubit, SelectItemsState>(
                            bloc: selectItemsCubitTemp,
                            builder: (context, state) {
                              if (state is SelectItemsSearch ||
                                  state is SelectItemsLoad ||
                                  state is SelectItemsInitError) {
                                return Text(
                                  state.selectedItems != null &&
                                          state.selectedItems!.value != null
                                      ? state.selectedItems!.value!
                                      : name.toString(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.fontMedium,
                                      color: enable
                                          ? AppColors.black
                                          : AppColors.gray,
                                      fontSize: 14.sp),
                                  textAlign: AppSetting.isArabic
                                      ? TextAlign.right
                                      : TextAlign.left,
                                );
                              } else {
                                return Text(
                                  name.toString(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.fontMedium,
                                      color: enable
                                          ? AppColors.black.withOpacity(.4)
                                          : AppColors.gray,
                                      fontSize: 14.sp),
                                  textAlign: AppSetting.isArabic
                                      ? TextAlign.right
                                      : TextAlign.left,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 25.sp,
                            color: enable
                                ? AppColors.mainColor
                                : AppColors.black.withOpacity(.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<SelectItemsCubit, SelectItemsState>(
            bloc: selectItemsCubitTemp,
            buildWhen: (previous, current) {
              if ((previous is SelectItemsError &&
                      current is SelectItemsLoad) ||
                  current is SelectItemsSearch) {
                return true;
              } else if (current is SelectItemsError) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              if (state is SelectItemsError || state is SelectItemsLoad) {
                return Align(
                  alignment: AppSetting.isArabic ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding:  EdgeInsets.all(8.sp),
                    child: CustomText(
                      text: state.errorText.toString(),
                      fontSize: 11.sp,
                      fontFamily: AppFonts.fontMedium,
                      color: Colors.red,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
