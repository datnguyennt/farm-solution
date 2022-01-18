import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImagePost {
  @JsonKey(name: 'imageId')
  int? imageId;
  @JsonKey(name: 'imagePath')
  String? imagePath;
  @JsonKey(name: 'postId')
  int? postId;
  @JsonKey(name: 'isDefault')
  bool? isDefault;
  @JsonKey(name: 'post')
  String? post;
  ImagePost();

  factory ImagePost.fromJson(Map<String, dynamic> json) => _$ImagePostFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePostToJson(this);
}
