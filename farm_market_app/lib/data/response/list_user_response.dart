//list_user_response
import 'package:farm_market_app/data/entity/account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class GetAllUserResponse {
  @JsonKey(name: 'Account')
  List<Account>? account;

  GetAllUserResponse();
  factory GetAllUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$GetAllUserResponseToJson(this);
}