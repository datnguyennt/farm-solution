// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weight_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeightTypeResponse _$GetWeightTypeResponseFromJson(
    Map<String, dynamic> json) {
  return GetWeightTypeResponse()
    ..weightId = json['weightId'] as int?
    ..weightName = json['weightName'] as String?;
}

Map<String, dynamic> _$GetWeightTypeResponseToJson(
        GetWeightTypeResponse instance) =>
    <String, dynamic>{
      'weightId': instance.weightId,
      'weightName': instance.weightName,
    };
