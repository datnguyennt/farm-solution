import 'package:json_annotation/json_annotation.dart';
part 'banner.g.dart';

@JsonSerializable()
class Banner {
  @JsonKey(name: "bannerId")
  int? bannerId;
  @JsonKey(name: "imagePath")
  String? imagePath;
  @JsonKey(name: "createTime")
  DateTime? createTime;
  @JsonKey(name: "topic")
  String? topic;
  @JsonKey(name: "isDelete")
  bool? isDelete;

  Banner();

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
