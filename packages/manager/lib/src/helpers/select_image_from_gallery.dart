// import 'dart:convert';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
// import 'package:manager/src/screens/managers_screens/add_category_screens/add_category_view_model.dart';
//
// class SelectImageFromGallery {
//   AddCategoryViewModel addCategoryViewModel = AddCategoryViewModel();
//   GenericCubit<bool> isImage = GenericCubit(data: false);
//
//   selectImageFromGallery() async {
//     XFile? xFile = await ImagePicker()
//         .pickImage(source: ImageSource.gallery, imageQuality: 10);
//     if (xFile != null) {
//       addCategoryViewModel.selectedImagePath.update(data: xFile.path);
//     }else{
//       return 'Image not selected';
//     }
//   }
//
//   changeImage(){
//     isImage.update(data: !isImage.state.data!);
//   }
// }
