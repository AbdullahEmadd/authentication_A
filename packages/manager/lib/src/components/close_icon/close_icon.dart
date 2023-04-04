import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/utility/app_colors.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-(.7.sw), .07.sh),
      child: SizedBox(
        child: InkWell(
          onTap: () async {
            goBack();
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white60,
              child: Icon(
                Icons.clear,
                color: AppColors.mainColor,
                size: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}