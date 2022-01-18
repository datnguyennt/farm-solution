import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'postID')
  int? postID;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'productName')
  String? productName;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'weightNumber')
  int? weightNumber;
  @JsonKey(name: 'weightName')
  String? weightName;
  @JsonKey(name: 'nameAccount')
  String? nameAccount;
  @JsonKey(name: 'accountId')
  int? accountId;
  @JsonKey(name: 'imageDefault')
  String? imageDefault;
  @JsonKey(name: 'viewCount')
  int? viewCount;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'catName')
  String? catName;
  @JsonKey(name: 'CategoryID')
  int? CategoryID;
  @JsonKey(name: 'WeightId')
  int? WeightId;
  @JsonKey(name: 'statusPost')
  int? statusPost;
  @JsonKey(name: 'timePost')
  DateTime? timePost;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'quality')
  String? quality;
  @JsonKey(name: 'isDeliver')
  bool? isDeliver;
  @JsonKey(name: 'expiry')
  int? expiry;
  @JsonKey(name: 'listImage')
  List<String>? listImage;
  double? distance;
  String? address;

  Post();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
