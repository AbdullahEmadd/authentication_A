// import 'package:first_task/utility/app_colors.dart';
// import 'package:first_task/utility/app_names.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(AppNames.home,
//           style: TextStyle(
//               fontFamily: 'Almarai',
//               color: Colors.black,
//               fontWeight: FontWeight.bold
//           ),),
//         actions: [Padding(
//           padding: const EdgeInsets.only(left: 15),
//           child: IconButton(onPressed: (){},
//             icon: Icon(Icons.notifications_outlined),
//             iconSize: 35,
//           ),
//         ),],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 70.h,
//             ),
//             Container(
//               height: 100,
//               width: 100 ,
//               decoration: BoxDecoration(
//                 color: AppColors.gray,
//                 borderRadius:
//                 BorderRadius.all(Radius.circular(100)),
//               ),
//               child: Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage('assets/images/me.png')),
//                     borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
