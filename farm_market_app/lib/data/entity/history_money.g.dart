// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryMoney _$HistoryMoneyFromJson(Map<String, dynamic> json) {
  return HistoryMoney()
    ..hisID = json['HisID'] as int?
    ..time =
        json['Time'] == null ? null : DateTime.parse(json['Time'] as String)
    ..numberMoney = json['NumberMoney'] as String?
    ..accountID = json['AccountID'] as String?;
}

Map<String, dynamic> _$HistoryMoneyToJson(HistoryMoney instance) =>
    <String, dynamic>{
      'HisID': instance.hisID,
      'Time': instance.time?.toIso8601String(),
      'NumberMoney': instance.numberMoney,
      'AccountID': instance.accountID,
    };
