// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneLoginRequest _$PhoneLoginRequestFromJson(Map<String, dynamic> json) {
  return PhoneLoginRequest(
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$PhoneLoginRequestToJson(PhoneLoginRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };
