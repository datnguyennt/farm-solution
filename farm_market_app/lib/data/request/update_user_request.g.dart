// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) {
  return UpdateUserRequest(
    AccountID: json['AccountID'] as String?,
    FullName: json['FullName'] as String?,
    Email: json['Email'] as String?,
    PhoneNumber: json['PhoneNumber'] as String?,
    Address: json['Address'] as String?,
    ThumbnailImage: json['ThumbnailImage'] as String?,
  );
}

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'AccountID': instance.AccountID,
      'FullName': instance.FullName,
      'PhoneNumber': instance.PhoneNumber,
      'Email': instance.Email,
      'Address': instance.Address,
      'ThumbnailImage': instance.ThumbnailImage,
    };
