// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAccount _$DataAccountFromJson(Map<String, dynamic> json) {
  return DataAccount()
    ..account = json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>)
    ..token = json['token'] as String?;
}

Map<String, dynamic> _$DataAccountToJson(DataAccount instance) =>
    <String, dynamic>{
      'account': instance.account,
      'token': instance.token,
    };
