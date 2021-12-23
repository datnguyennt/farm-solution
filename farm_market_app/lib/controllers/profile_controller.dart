import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  DateTime dateTime = DateTime(2100);
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  XFile? pickedFile;
  void selectImage(ImageSource imageSource) async {
    try {
      pickedFile = await ImagePicker().pickImage(source: imageSource);
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
  }

}