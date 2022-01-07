import 'package:json_annotation/json_annotation.dart';
part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  int? AccountID;
  String? OldPass;
  String? NewPass;
  String? ConfirmNewPass;

  ChangePasswordRequest(
      {this.AccountID,this.OldPass, this.NewPass, this.ConfirmNewPass});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
