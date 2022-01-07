import 'dart:io';

import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostItemController extends GetxController {
  WeightType? selectedWeightTypeItem;
  //final postItemForm = GlobalKey<FormState>(debugLabel: 'postItemForm');
  Category? selectedCategory;
  final ImagePicker picker = ImagePicker();
  List<XFile> imageList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController weightTypeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void setWeightTypeSelected(WeightType value) {
    selectedWeightTypeItem = value;
  }

  void setCategorySelected(Category value) {
    selectedCategory = value;
  }

  // validateForm() {
  //   if (postItemForm.currentState!.validate()) {
  //     print('passsed');
  //   } else {
  //     print('error');
  //   }
  // }

  List<WeightType> weightType = [
    WeightType(id: 0, title: "Kg"),
    WeightType(id: 1, title: "Gram"),
    WeightType(id: 2, title: "Lạng"),
    WeightType(id: 3, title: "Củ"),
    WeightType(id: 4, title: "Bó"),
    WeightType(id: 5, title: "Cây"),
  ];
  List<Category> categoires = [
    Category(id: 1, title: "Rau"),
    Category(id: 2, title: "Củ khô"),
    Category(id: 3, title: "Rau gia vị"),
    Category(id: 4, title: "Trái cây"),
  ];
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var selectedVideoPath = ''.obs;
  var selectedVideoSize = ''.obs;
  XFile? file;
  final ImagePicker _picker = ImagePicker();
// Pick multiple images
  List<XFile> images = [];
  //Lấy ảnh từ thư viện
  Future<void> selectImage(ImageSource imageSrc) async {
    //final pickedFile = await ImagePicker().pickImage(source: imageSrc);
    final List<XFile>? pickles = await _picker.pickMultiImage();
    images.clear();

    if (pickles != null) {
      images = pickles;
      // selectedImagePath.value = pickedFile.path;
      // selectedImageSize.value =
      //     ((File(selectedImagePath.value)).lengthSync() / 2024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
    } else {
      Get.snackbar(
        'ERROR',
        'No image selected',
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
      );
    }
  }
  Future<void> selectVideo(ImageSource imageSrc) async {
    final pickedFile = await ImagePicker().pickVideo(source: imageSrc);
    if (pickedFile != null) {
      selectedVideoPath.value = pickedFile.path;
      selectedVideoSize.value =
          ((File(selectedVideoSize.value)).lengthSync() / 2024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar(
        'ERROR',
        'No image selected',
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
      );
    }
  }

  //Load data lên đơn vị tính
  DropdownMenuItem<WeightType> weightTypeItem(WeightType item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item.title,
          style: AppTextStyle.regular14(
            color: AppColor.black,
          ),
        ),
      );

  //Load data lên loại nông sản
  DropdownMenuItem<Category> categoryItem(Category item) => DropdownMenuItem(
        value: item,
        child: Text(
          item.title,
          style: AppTextStyle.regular14(
            color: AppColor.black,
          ),
        ),
      );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Globals.mainUser.address != null
        ? addressController.text = Globals.mainUser.address.toString()
        : null;
  }
}
