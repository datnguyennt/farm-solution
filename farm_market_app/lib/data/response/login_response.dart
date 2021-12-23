import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/data/entity/history_money.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "account")
  Account? account;
  @JsonKey(name: "token")
  String? token;

  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$LoginResponseToJson(this);
}
