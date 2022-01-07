// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllPostResponse _$GetAllPostResponseFromJson(Map<String, dynamic> json) {
  return GetAllPostResponse()
    ..postId = json['postId'] as int?
    ..title = json['title'] as String?
    ..productName = json['productName'] as String?
    ..description = json['description'] as String?
    ..price = (json['price'] as num?)?.toDouble()
    ..weightNumber = (json['weightNumber'] as num?)?.toDouble()
    ..address = json['address'] as String?
    ..phoneNumber = json['phoneNumber'] as String?
    ..quality = json['quality'] as String?
    ..weightId = json['weightId'] as int?
    ..categoryId = json['categoryId'] as int?
    ..accountId = json['accountId'] as int?
    ..viewCount = json['viewCount'] as int?
    ..lat = (json['lat'] as num?)?.toDouble()
    ..lng = (json['lng'] as num?)?.toDouble();
}

Map<String, dynamic> _$GetAllPostResponseToJson(GetAllPostResponse instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'productName': instance.productName,
      'description': instance.description,
      'price': instance.price,
      'weightNumber': instance.weightNumber,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'quality': instance.quality,
      'weightId': instance.weightId,
      'categoryId': instance.categoryId,
      'accountId': instance.accountId,
      'viewCount': instance.viewCount,
      'lat': instance.lat,
      'lng': instance.lng,
    };
