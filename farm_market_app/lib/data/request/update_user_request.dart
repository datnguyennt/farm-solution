//update_user_request
import 'package:json_annotation/json_annotation.dart';
part 'update_user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  String? AccountID;
  String? FullName;
  String? PhoneNumber;
  String? Email;
  String? Address;
  String? ThumbnailImage;

  UpdateUserRequest(
      {this.AccountID, this.FullName, this.Email, this.PhoneNumber, this.Address, this.ThumbnailImage});

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
