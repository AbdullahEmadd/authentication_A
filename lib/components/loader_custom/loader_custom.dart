import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loader extends StatelessWidget {
  final Loading loading;
  final Widget? loader;

  const Loader({super.key, required this.loading, this.loader});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Loading, LoadingState>(
      bloc: loading,
      builder: (context, state) {
        if (state is LoadingChange) {
          return state.loading!
              ? WillPopScope(
                  child: loader == null ? const LoaderItem() : loader!,
                  onWillPop: () async {
                    loading.hide;
                    return true;
                  },
                )
              : Container();
        } else {
          return Container();
        }
      },
    );
  }
}

class LoaderItem extends StatelessWidget {
  const LoaderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0.sp),
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 5,
            backgroundColor: AppColors.mainColor,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}
