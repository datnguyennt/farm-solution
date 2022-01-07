import 'package:json_annotation/json_annotation.dart';
part 'create_account_response.g.dart';

@JsonSerializable()
class CreateAccountResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  CreateAccountResponse();

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$CreateAccountResponseToJson(this);
}
