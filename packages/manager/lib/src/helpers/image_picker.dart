import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> uploadImage(
    {ImageSource imageSource = ImageSource.gallery}) async {
  XFile? xFile = await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
  if (xFile != null) {
    return File(xFile.path);
  } else {
    return null;
  }
}
