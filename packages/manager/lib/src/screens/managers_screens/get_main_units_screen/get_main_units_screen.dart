import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/get_main_units_screen/get_main_units_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class GetMainUnitsScreen extends StatefulWidget {

  @override
  State<GetMainUnitsScreen> createState() => _GetMainUnitsScreenState();
}

class _GetMainUnitsScreenState extends State<GetMainUnitsScreen> {
  GetMainUnitsViewModel getMainUnitsViewModel = GetMainUnitsViewModel();
  @override
  void initState() {
    getMainUnitsViewModel.getMainUnits();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
                text: AppNames.mainUnits,
                fontSize: 16.sp,
                color: AppColors.black,
                fontWeight: FontWeight.bold),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                  iconSize: 35,
                ),
              ),
            ],
          ),
          body:
          BlocBuilder<GenericCubit<List<MainUnitsModel>>,
              GenericState<List<MainUnitsModel>>>(
            bloc: getMainUnitsViewModel.getMainUnitsModel,
            builder: (context, state) {
              return ListView.builder(
                  itemCount: getMainUnitsViewModel
                      .getMainUnitsModel.state.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 82.h,
                        child: Card(
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width / 3 -
                                      20.w,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: getMainUnitsViewModel
                                            .getMainUnitsModel
                                            .state
                                            .data![index]
                                            .name!,
                                        maxLines: 2,
                                        fontSize: 11.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      CustomText(
                                        text: '5 قطع',
                                        textAlign: TextAlign.end,
                                        fontSize: 11.sp,
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                          ),
                                        )),
                                    Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                          ),
                                        )),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    );
                  });
            },
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.mainColor,
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // TODO
                goToScreen(screenNames: ScreenNames.addMainUnitScreen);
              }),
        ),
        Loader(loading: getMainUnitsViewModel.loading),
      ],
    );
  }
}
