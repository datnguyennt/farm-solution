//get_account_by_id
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_account_by_id_response.g.dart';

@JsonSerializable()
class GetAccountByIdResponse {
  @JsonKey(name: "data")
  Account? data;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  GetAccountByIdResponse();

  factory GetAccountByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountByIdResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$GetAccountByIdResponseToJson(this);
}
