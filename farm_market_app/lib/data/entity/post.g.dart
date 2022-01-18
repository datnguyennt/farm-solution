// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..postID = json['postID'] as int?
    ..title = json['title'] as String?
    ..productName = json['productName'] as String?
    ..price = (json['price'] as num?)?.toDouble()
    ..weightNumber = json['weightNumber'] as int?
    ..weightName = json['weightName'] as String?
    ..nameAccount = json['nameAccount'] as String?
    ..accountId = json['accountId'] as int?
    ..imageDefault = json['imageDefault'] as String?
    ..viewCount = json['viewCount'] as int?
    ..lat = json['lat'] as String?
    ..lng = json['lng'] as String?
    ..catName = json['catName'] as String?
    ..CategoryID = json['CategoryID'] as int?
    ..WeightId = json['WeightId'] as int?
    ..statusPost = json['statusPost'] as int?
    ..timePost = json['timePost'] == null
        ? null
        : DateTime.parse(json['timePost'] as String)
    ..description = json['description'] as String?
    ..phone = json['phone'] as String?
    ..quality = json['quality'] as String?
    ..isDeliver = json['isDeliver'] as bool?
    ..expiry = json['expiry'] as int?
    ..listImage =
        (json['listImage'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..distance = (json['distance'] as num?)?.toDouble()
    ..address = json['address'] as String?;
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postID': instance.postID,
      'title': instance.title,
      'productName': instance.productName,
      'price': instance.price,
      'weightNumber': instance.weightNumber,
      'weightName': instance.weightName,
      'nameAccount': instance.nameAccount,
      'accountId': instance.accountId,
      'imageDefault': instance.imageDefault,
      'viewCount': instance.viewCount,
      'lat': instance.lat,
      'lng': instance.lng,
      'catName': instance.catName,
      'CategoryID': instance.CategoryID,
      'WeightId': instance.WeightId,
      'statusPost': instance.statusPost,
      'timePost': instance.timePost?.toIso8601String(),
      'description': instance.description,
      'phone': instance.phone,
      'quality': instance.quality,
      'isDeliver': instance.isDeliver,
      'expiry': instance.expiry,
      'listImage': instance.listImage,
      'distance': instance.distance,
      'address': instance.address,
    };
