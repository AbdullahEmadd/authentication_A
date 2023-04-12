import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/routes/routes.dart';

import '../cubits/select_items_cubit/selectitems_cubit.dart';
import '../models/items_model/items.dart';
import '../utility/app_colors.dart';
import '../utility/app_fonts.dart';
import 'custom_text/custom_text.dart';

class CustomAlertSelectItems {
  static customSelectItems({
    required String displayName,
    required SelectItemsCubit selectItemsCubit,
    required Function(Item item) afterSelectItem,
  }) {
    double? containerHeight = selectItemsCubit.state.searchItemsList!.length > 7
        ? MediaQuery.of(Get.context!).size.height -
            (MediaQuery.of(Get.context!).padding.top +
                MediaQuery.of(Get.context!).padding.bottom +
                200)
        : null;
    if (selectItemsCubit.state.items!.isNotEmpty) {
      return showDialog(
        context: Get.context!,
        builder: (context) {
          return BlocConsumer<SelectItemsCubit, SelectItemsState>(
            bloc: selectItemsCubit,
            listener: (context, state) {},
            builder: (context, state) {
              return SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(15.r))),
                contentPadding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
                title: SizedBox(
                  height: 40.w,
                  child: Center(
                    child: selectItemsCubit.state.items!.length > 10
                        ? TextFormField(
                            onChanged: (val) {
                              containerHeight = MediaQuery.of(context).size.height -
                                  (MediaQuery.of(context).padding.top +
                                      150 +
                                      MediaQuery.of(context).padding.bottom +
                                      MediaQuery.of(context).viewInsets.bottom +
                                      MediaQuery.of(context).viewInsets.top);

                              //!  Search in Items By text From text Input Field
                              selectItemsCubit.searchInItemsList(val);
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                                borderSide: const BorderSide(),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      SizedBox(
                        height: containerHeight,
                        width: 1.sw,
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(3.w, 10.h, 3.w, 30.h),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        displayName, textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFonts.fontMedium,
                                          color: AppColors.mainColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.fromLTRB(
                                            30.w, 10.h, 30.0.w, 10.h),
                                        child: const Divider(
                                          thickness: 0.5,
                                          height: 0.5,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                for (var i = 0; i < selectItemsCubit.state.searchItemsList!.length; i++)
                                  GestureDetector(
                                    onTap: () {
                                      selectItemsCubit.selectItems(selectItemsCubit.state.searchItemsList![i]);
                                      afterSelectItem(selectItemsCubit.state.searchItemsList![i]);
                                      goBack();
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  selectItemsCubit.state.searchItemsList![i].value.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: AppFonts.fontMedium,
                                                      color: AppColors.black.withOpacity(.5),
                                                      fontSize: 14.sp)),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                                                child: const Divider(
                                                  thickness: 0.5,
                                                  height: 0.5,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                selectItemsCubit.state.searchItemsList!.isEmpty
                                    ? Padding(
                                        padding:  EdgeInsets.all(10.sp),
                                        child: Text(
                                          'No data contain  " ${selectItemsCubit.state.searchWord} "',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppFonts.fontMedium,
                                            color: AppColors.mainColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : Container(),
                                SizedBox(height: 30.h,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r)),
                            color: AppColors.mainColor
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Center(
                              child: CustomText(
                                text : "رجوع",
                                fontSize: 14.sp,
                                fontFamily: AppFonts.fontMedium,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    } else {
      return Container();
    }
  }
}
