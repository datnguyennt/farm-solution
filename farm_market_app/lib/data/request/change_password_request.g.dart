// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordRequest(
    AccountID: json['AccountID'] as int?,
    OldPass: json['OldPass'] as String?,
    NewPass: json['NewPass'] as String?,
    ConfirmNewPass: json['ConfirmNewPass'] as String?,
  );
}

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'AccountID': instance.AccountID,
      'OldPass': instance.OldPass,
      'NewPass': instance.NewPass,
      'ConfirmNewPass': instance.ConfirmNewPass,
    };
