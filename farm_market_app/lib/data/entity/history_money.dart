import 'package:json_annotation/json_annotation.dart';

part 'history_money.g.dart';

@JsonSerializable()
class HistoryMoney {
  @JsonKey(name: "HisID")
  int? hisID;
  @JsonKey(name: "Time")
  DateTime? time;
  @JsonKey(name: "NumberMoney")
  String? numberMoney;
  @JsonKey(name: "AccountID")
  String? accountID;
  HistoryMoney();

  factory HistoryMoney.fromJson(Map<String, dynamic> json) => _$HistoryMoneyFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryMoneyToJson(this);
}
