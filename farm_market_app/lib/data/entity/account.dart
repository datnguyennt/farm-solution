import 'package:farm_market_app/data/entity/history_money.dart';
import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: "accountId")
  int? accountId;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "confirmPassword")
  String? confirmPassword;
  @JsonKey(name: "keySecurity")
  String? keySecurity;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "fullName")
  String? fullName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "numberOfPost")
  int? numberOfPost;
  @JsonKey(name: "moneyOfOver")
  int? moneyOfOver;
  @JsonKey(name: "createDate")
  DateTime? createDate;
  @JsonKey(name: "isDelete")
  bool? isDelete;
  @JsonKey(name: "rolesId")
  int? rolesId;
  @JsonKey(name: "roles")
  int? roles;
  @JsonKey(name: "historyMoneys")
  List<HistoryMoney>? historyMoneys;
  @JsonKey(name: "loves")
  List<dynamic>? loves;
  @JsonKey(name: "reviews")
  List<dynamic>? reviews;

  Account();

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
