import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_empty_data/custom_empty_data.dart';
import 'package:manager/src/components/custom_floating_action/custom_floating_action.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/unit_screens/get_main_units_screen/get_main_units_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class GetMainUnitsScreen extends StatefulWidget {
  const GetMainUnitsScreen({super.key});

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
          appBar: CustomAppBar(
            textAppBar: AppNames.mainUnits,
          ),
          body: BlocBuilder<GenericCubit<List<MainUnitsModel>>,
              GenericState<List<MainUnitsModel>>>(
            bloc: getMainUnitsViewModel.getMainUnitsModel,
            builder: (context, state) {
              if (state is GenericUpdate) {
                return state.data!.isNotEmpty
                  ? ListView.builder(
                      itemCount: getMainUnitsViewModel.getMainUnitsModel.state.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            String unitId = getMainUnitsViewModel
                                .getMainUnitsModel.state.data![index].id!;
                            goToScreen(
                                screenNames: ScreenNames.getSubUnitsScreen,
                                arguments: unitId);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.w , vertical: 20.h),
                                child: CustomText(
                                  text: state.data![index].name.toString(),
                                  maxLines: 2,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                  : const CustomEmptyData();
              } else {return Container();}
            },
          ),
          floatingActionButton: CustomFloatingAction(onPressed: () {
            goToScreen(
                screenNames: ScreenNames.addMainUnitScreen,
                arguments: getMainUnitsViewModel);
          }),
        ),
        Loader(loading: getMainUnitsViewModel.loading),
      ],
    );
  }
}
