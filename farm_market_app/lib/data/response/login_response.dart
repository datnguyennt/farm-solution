import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "data")
  DataAccount? data;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$LoginResponseToJson(this);
}
