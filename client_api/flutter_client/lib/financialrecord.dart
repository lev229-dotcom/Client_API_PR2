import 'package:freezed_annotation/freezed_annotation.dart';
part 'financialrecord.freezed.dart';
part 'financialrecord.g.dart';

@freezed
class FinancialRecord with _$FinancialRecord {
  const factory FinancialRecord({
    int? id,
    String? operationName,
    String? description,
    String? category,
    DateTime? date,
    double? sum,
    bool? status,
  }) = _FinancialRecord;

  factory FinancialRecord.fromJson(Map<String, dynamic> json) =>
      _$FinancialRecordFromJson(json);
}
