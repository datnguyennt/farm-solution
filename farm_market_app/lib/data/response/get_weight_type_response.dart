import 'package:json_annotation/json_annotation.dart';

part 'get_weight_type_response.g.dart';

@JsonSerializable()
class GetWeightTypeResponse {
  @JsonKey(name: 'weightId')
  int? weightId;
  @JsonKey(name: 'weightName')
  String? weightName;

  GetWeightTypeResponse();

  factory GetWeightTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWeightTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeightTypeResponseToJson(this);
}
