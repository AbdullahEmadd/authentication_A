import 'package:first_task/screens/managers_screens/manager_drawer.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:first_task/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/app_colors.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppNames.home,
        style: TextStyle(
          fontFamily: 'Almarai',
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppNames.departments,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Almarai',
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mainColor
                        ),
                        child: IconButton(onPressed: (){}, icon:
                        Icon(Icons.add),
                        color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0.4,
                  children: [
                    Image.asset('assets/images/mobile.png'),
                    Image.asset('assets/images/design.png'),
                    Image.asset('assets/images/backend.png'),
                    Image.asset('assets/images/qc.png'),
                  ],
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                      AppNames.employees,
                      style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Almarai',
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                    ),
                    ]
                  )),
                  SizedBox(
                    height: 12.h,
                  ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0.4,
                  children: [
                    Image.asset('assets/images/emp1.png'),
                    Image.asset('assets/images/emp2.png'),
                    Image.asset('assets/images/emp3.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: ManagerDrawerScreen(),

    );
  }
}
