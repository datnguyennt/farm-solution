import 'package:farm_market_app/data/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_account.g.dart';

@JsonSerializable()
class DataAccount {
  @JsonKey(name: "account")
  Account? account;
  @JsonKey(name: "token")
  String? token;
  DataAccount();

  factory DataAccount.fromJson(Map<String, dynamic> json) => _$DataAccountFromJson(json);

  Map<String, dynamic> toJson() => _$DataAccountToJson(this);
}
