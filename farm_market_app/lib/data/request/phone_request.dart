//phone_request
import 'package:json_annotation/json_annotation.dart';
part 'phone_request.g.dart';

@JsonSerializable()
class PhoneLoginRequest {
  String? phoneNumber;

  PhoneLoginRequest(
      {this.phoneNumber});

  factory PhoneLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneLoginRequestToJson(this);
}
