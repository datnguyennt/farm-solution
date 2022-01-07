//list_user_response
import 'package:json_annotation/json_annotation.dart';

part 'get_all_post_response.g.dart';

@JsonSerializable()
class GetAllPostResponse {
  @JsonKey(name: 'postId')
  int? postId;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'productName')
  String? productName;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'weightNumber')
  double? weightNumber;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'quality')
  String? quality;
  @JsonKey(name: 'weightId')
  int? weightId;
  @JsonKey(name: 'categoryId')
  int? categoryId;
  @JsonKey(name: 'accountId')
  int? accountId;
  @JsonKey(name: 'viewCount')
  int? viewCount;
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lng')
  double? lng;


  GetAllPostResponse();
  factory GetAllPostResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllPostResponseFromJson(json);
  Map<String, dynamic> toJson(String response) =>
      _$GetAllPostResponseToJson(this);
}