import 'package:flutter/material.dart';
import 'package:manager/src/utility/app_colors.dart';

class ProfileDataPreviewItem extends StatelessWidget {
  final String ?title;
  final String ?value;
  const ProfileDataPreviewItem({Key? key,this.value,this.title}) : super(key: key);

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
