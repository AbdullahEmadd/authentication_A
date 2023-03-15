import 'package:first_task/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileDataPreviewItem extends StatelessWidget {
  String ?title;
  String ?value;
  ProfileDataPreviewItem({Key? key,this.value,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.gray,borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title??'',style: const TextStyle(fontSize: 14),),
            Text(value??'',style: const TextStyle(fontSize: 14),),
          ],),
      ),
    );
  }
}
