//get_post_detail_response

import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_post_detail_response.g.dart';

@JsonSerializable()
class GetPostDetailResponse {
  @JsonKey(name: 'data')
  Post? data;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'listImage')
  List<ImagePost>? listImage;

  GetPostDetailResponse();

  factory GetPostDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostDetailResponseToJson(this);
}
