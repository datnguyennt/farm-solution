// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountResponse _$CreateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAccountResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$CreateAccountResponseToJson(
        CreateAccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
