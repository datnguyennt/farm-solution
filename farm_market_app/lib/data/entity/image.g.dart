// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagePost _$ImagePostFromJson(Map<String, dynamic> json) {
  return ImagePost()
    ..imageId = json['imageId'] as int?
    ..imagePath = json['imagePath'] as String?
    ..postId = json['postId'] as int?
    ..isDefault = json['isDefault'] as bool?
    ..post = json['post'] as String?;
}

Map<String, dynamic> _$ImagePostToJson(ImagePost instance) => <String, dynamic>{
      'imageId': instance.imageId,
      'imagePath': instance.imagePath,
      'postId': instance.postId,
      'isDefault': instance.isDefault,
      'post': instance.post,
    };
