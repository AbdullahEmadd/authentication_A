import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_empty_data/custom_empty_data.dart';
import 'package:manager/src/components/custom_floating_action/custom_floating_action.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/sub_units_model/sub_units_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/add_sub_unit_screen/add_sub_unit_screen.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/get_sub_units_screen/get_sub_units_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class GetSubUnitsScreen extends StatefulWidget {
  const GetSubUnitsScreen({super.key});

  @override
  State<GetSubUnitsScreen> createState() => _GetSubUnitsScreenState();
}

class _GetSubUnitsScreenState extends State<GetSubUnitsScreen> {
  GetSubUnitsViewModel getSubUnitsViewModel = GetSubUnitsViewModel();

  @override
  void initState() {
    getSubUnitsViewModel.initialize();
    getSubUnitsViewModel.initData();
    globalData.getSubUnitsViewModel = getSubUnitsViewModel;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            textAppBar: AppNames.subUnits,
          ),
          body:
          BlocBuilder<GenericCubit<List<SubUnitsModel>>,
              GenericState<List<SubUnitsModel>>>(
            bloc: getSubUnitsViewModel.getSubUnitsModel,
            builder: (context, state) {
              if (state is GenericUpdate) {
                return ListView.builder(
                  itemCount: getSubUnitsViewModel
                      .getSubUnitsModel.state.data!.length,
                  itemBuilder: (context, index) {
                    return state.data!.isNotEmpty? InkWell(
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
                                        text: getSubUnitsViewModel
                                            .getSubUnitsModel
                                            .state
                                            .data![index]
                                            .name!,
                                        maxLines: 2,
                                        fontSize: 11.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ): const CustomEmptyData();
                  });
              } else {
                return Container();
              }
            },
          ),
          floatingActionButton: CustomFloatingAction(
              onPressed: () {
                goToScreen(screenNames: ScreenNames.addSubUnitScreen, arguments: AddSubUnitScreen(
                  getSubUnitsViewModel: getSubUnitsViewModel,
                ));
              }),
        ),
        Loader(loading: getSubUnitsViewModel.loading),
      ],
    );
  }
}
