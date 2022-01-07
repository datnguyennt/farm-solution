// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..postId = json['postId'] as int?
    ..title = json['title'] as String?
    ..productName = json['productName'] as String?
    ..price = (json['price'] as num?)?.toDouble()
    ..weightName = json['weightName'] as String?
    ..nameAccount = json['nameAccount'] as String?
    ..imageDefault = json['imageDefault'] as String?
    ..viewCount = json['viewCount'] as int?
    ..lat = json['lat'] as String?
    ..lng = json['lng'] as String?
    ..distance = (json['distance'] as num?)?.toDouble();
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'productName': instance.productName,
      'price': instance.price,
      'weightName': instance.weightName,
      'nameAccount': instance.nameAccount,
      'imageDefault': instance.imageDefault,
      'viewCount': instance.viewCount,
      'lat': instance.lat,
      'lng': instance.lng,
      'distance': instance.distance,
    };
