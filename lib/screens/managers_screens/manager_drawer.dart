import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/app_colors.dart';

class ManagerDrawerScreen extends StatefulWidget {
  const ManagerDrawerScreen({Key? key}) : super(key: key);

  @override
  State<ManagerDrawerScreen> createState() => _ManagerDrawerScreenState();
}

class _ManagerDrawerScreenState extends State<ManagerDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Container(
              color: Color(0xffF7F7F7),
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                DrawerHeader(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              child: CircleAvatar(
                                  radius: (50),
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      "https://i.pinimg.com/originals/0e/b5/42/0eb54293405681ea75b278308bb8f916.png",
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.contain,
                                    ),
                                  ))),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                'User Name',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "ALMARAI-BOLD",
                                    color: Colors.black),
                              ),
                              Text(
                                'EXCP',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "ALMARAI",
                                    color: AppColors.mainColor),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
    );
  }
}
