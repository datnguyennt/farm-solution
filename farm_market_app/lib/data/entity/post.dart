import 'package:farm_market_app/data/entity/history_money.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'postId')
  int? postId;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'productName')
  String? productName;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'weightName')
  String? weightName;
  @JsonKey(name: 'nameAccount')
  String? nameAccount;
  @JsonKey(name: 'imageDefault')
  String? imageDefault;
  @JsonKey(name: 'viewCount')
  int? viewCount;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  double? distance;

  Post();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
