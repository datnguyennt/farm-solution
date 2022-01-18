// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostDetailResponse _$GetPostDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetPostDetailResponse()
    ..data = json['data'] == null
        ? null
        : Post.fromJson(json['data'] as Map<String, dynamic>)
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..listImage = (json['listImage'] as List<dynamic>?)
        ?.map((e) => ImagePost.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetPostDetailResponseToJson(
        GetPostDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'listImage': instance.listImage,
    };
