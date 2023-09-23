import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../utils/widgets/image_picketr.dart';
import 'dart:io';

class HomeScreenCtrl extends GetxController {
  RxString pickedPath = ''.obs;
  RxnString image = RxnString();
  User? user;

  Future<String> imagePicker() async {
    File res = await PickImages.pickImages();
    if (res.path.isNotEmpty) {
      image.value = res.path;
      pickedPath(res.path);
    }
    return res.path;
  }
}
