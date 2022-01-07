import 'package:json_annotation/json_annotation.dart';
part 'update_account_response.g.dart';

@JsonSerializable()
class UpdateAccountResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  UpdateAccountResponse();

  factory UpdateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$UpdateAccountResponseToJson(this);
}
