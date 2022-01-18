// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountByIdResponse _$GetAccountByIdResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountByIdResponse()
    ..data = json['data'] == null
        ? null
        : Account.fromJson(json['data'] as Map<String, dynamic>)
    ..status = json['status'] as String?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$GetAccountByIdResponseToJson(
        GetAccountByIdResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
