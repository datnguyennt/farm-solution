// To parse this JSON data, do
//
//     final loginPhoneResponse = loginPhoneResponseFromJson(jsonString);

import 'dart:convert';

import 'package:farm_market_app/data/entity/entity.dart';

LoginPhoneResponse loginPhoneResponseFromJson(String str) => LoginPhoneResponse.fromJson(json.decode(str));

String loginPhoneResponseToJson(LoginPhoneResponse data) => json.encode(data.toJson());

class LoginPhoneResponse {
  LoginPhoneResponse({
    this.data,
    this.status,
  });

  Account? data;
  String? status;

  factory LoginPhoneResponse.fromJson(Map<String, dynamic> json) => LoginPhoneResponse(
    data: Account.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
  };
}
