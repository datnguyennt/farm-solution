// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_by_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostByAccountResponse _$GetPostByAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetPostByAccountResponse()
    ..data = (json['data'] as List<dynamic>?)
        ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList()
    ..status = json['status'] as String?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$GetPostByAccountResponseToJson(
        GetPostByAccountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
