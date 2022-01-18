//create_post_response
import 'package:json_annotation/json_annotation.dart';
part 'create_post_response.g.dart';

@JsonSerializable()
class CreatePostResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  CreatePostResponse();

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$CreatePostResponseToJson(this);
}
