//change_password_response

import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  ChangePasswordResponse();

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$ChangePasswordResponseToJson(this);
}
