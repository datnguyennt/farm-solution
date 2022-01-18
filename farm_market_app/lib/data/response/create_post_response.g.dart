// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostResponse _$CreatePostResponseFromJson(Map<String, dynamic> json) {
  return CreatePostResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$CreatePostResponseToJson(CreatePostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
