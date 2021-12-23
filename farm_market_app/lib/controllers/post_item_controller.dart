import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostItemController extends GetxController {
  // It is mandatory initialize with one value from listType
  WeightType? selectedWeightTypeItem;
  Category? selectedCategory;
  final ImagePicker picker = ImagePicker();
  List<XFile> imageList = [];

  void setWeightTypeSelected(WeightType value) {
    selectedWeightTypeItem = value;
  }

  void setCategorySelected(Category value) {
    selectedCategory = value;
  }

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

  //Lấy ảnh từ thư viện
  Future<void> selectImage() async {
    final selectedImage =
        await picker.pickMultiImage();
    if (selectedImage!.isNotEmpty) {
      imageList.addAll(selectedImage);
    }
    print(selectedImage.length.toString());
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
}
