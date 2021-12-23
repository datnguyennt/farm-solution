// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse()
    ..account = json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>)
    ..token = json['token'] as String?;
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'account': instance.account,
      'token': instance.token,
    };
