// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountResponse _$UpdateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$UpdateAccountResponseToJson(
        UpdateAccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
