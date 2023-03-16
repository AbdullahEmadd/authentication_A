import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/managers_screens/manager_drawer.dart';
import 'package:first_task/utility/app_names.dart';
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
        actions: [Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(onPressed: (){},
              icon: Icon(Icons.notifications_outlined),
             iconSize: 35,
          ),
        ),],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppNames.main,
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
                      child: IconButton(onPressed: (){
                        goToScreen(screenNames: ScreenNames.addCategoryScreen);
                      }, icon:
                      Icon(Icons.add),
                      color: Colors.white,
                      ),
                    )
                  ],
                ),
                GridView.count(
                  childAspectRatio: 1.4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  children: [
                    Image.asset('assets/images/foods.png'),
                    Image.asset('assets/images/extras.png'),
                  ],
                ),
                Transform.scale(
                    scale: 0.6,
                    child: Image.asset('assets/images/drinks.png')),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    AppNames.mostOrdered,
                    style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Almarai',
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          'الكل',
                          style: TextStyle(
                            fontSize: 22
                          ),
                        ))
                  ]
                ),
                  SizedBox(
                    height: 20.h,
                  ),
                Image.asset('assets/images/mostOrdered2.png')
              ],
            ),
          ),
        ),
      ),
      drawer: ManagerDrawerScreen(),
    );
  }
}
