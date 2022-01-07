// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner()
    ..bannerId = json['bannerId'] as int?
    ..imagePath = json['imagePath'] as String?
    ..createTime = json['createTime'] == null
        ? null
        : DateTime.parse(json['createTime'] as String)
    ..topic = json['topic'] as String?
    ..isDelete = json['isDelete'] as bool?;
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'bannerId': instance.bannerId,
      'imagePath': instance.imagePath,
      'createTime': instance.createTime?.toIso8601String(),
      'topic': instance.topic,
      'isDelete': instance.isDelete,
    };
