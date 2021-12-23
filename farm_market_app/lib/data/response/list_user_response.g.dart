// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserResponse _$GetAllUserResponseFromJson(Map<String, dynamic> json) {
  return GetAllUserResponse()
    ..account = (json['Account'] as List<dynamic>?)
        ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetAllUserResponseToJson(GetAllUserResponse instance) =>
    <String, dynamic>{
      'Account': instance.account,
    };
