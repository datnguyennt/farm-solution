import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: "categoryID")
  int? categoryID;
  @JsonKey(name: "cateName")
  String? cateName;
  @JsonKey(name: "image")
  String? image;

  Category();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
