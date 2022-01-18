//get_post_by_account_response
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_post_by_account_response.g.dart';

@JsonSerializable()
class GetPostByAccountResponse {
  @JsonKey(name: "data")
  List<Post>? data;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  GetPostByAccountResponse();

  factory GetPostByAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostByAccountResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$GetPostByAccountResponseToJson(this);
}
