//weight_type

import 'package:json_annotation/json_annotation.dart';
part 'weight_type.g.dart';

@JsonSerializable()
class WeightType {
  @JsonKey(name: 'weightId')
  int? weightId;
  @JsonKey(name: 'weightName')
  String? weightName;
  WeightType();

  factory WeightType.fromJson(Map<String, dynamic> json) => _$WeightTypeFromJson(json);

  Map<String, dynamic> toJson() => _$WeightTypeToJson(this);
}
