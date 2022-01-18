// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category()
    ..categoryID = json['categoryID'] as int?
    ..cateName = json['cateName'] as String?
    ..image = json['image'] as String?;
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryID': instance.categoryID,
      'cateName': instance.cateName,
      'image': instance.image,
    };
