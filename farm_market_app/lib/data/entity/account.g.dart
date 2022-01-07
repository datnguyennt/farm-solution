// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account()
    ..accountId = json['accountId'] as int?
    ..phoneNumber = json['phoneNumber'] as String?
    ..userName = json['userName'] as String?
    ..password = json['password'] as String?
    ..keySecurity = json['keySecurity'] as String?
    ..address = json['address'] as String?
    ..fullName = json['fullName'] as String?
    ..email = json['email'] as String?
    ..avatar = json['avatar'] as String?
    ..numberOfPost = json['numberOfPost'] as int?
    ..moneyOfOver = json['moneyOfOver'] as int?
    ..createDate = json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String)
    ..isDelete = json['isDelete'] as bool?
    ..rolesId = json['rolesId'] as int?
    ..roles = json['roles'] as int?
    ..historyMoneys = (json['historyMoneys'] as List<dynamic>?)
        ?.map((e) => HistoryMoney.fromJson(e as Map<String, dynamic>))
        .toList()
    ..loves = json['loves'] as List<dynamic>?
    ..reviews = json['reviews'] as List<dynamic>?;
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'phoneNumber': instance.phoneNumber,
      'userName': instance.userName,
      'password': instance.password,
      'keySecurity': instance.keySecurity,
      'address': instance.address,
      'fullName': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatar,
      'numberOfPost': instance.numberOfPost,
      'moneyOfOver': instance.moneyOfOver,
      'createDate': instance.createDate?.toIso8601String(),
      'isDelete': instance.isDelete,
      'rolesId': instance.rolesId,
      'roles': instance.roles,
      'historyMoneys': instance.historyMoneys,
      'loves': instance.loves,
      'reviews': instance.reviews,
    };
