// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financialrecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FinancialRecord _$$_FinancialRecordFromJson(Map<String, dynamic> json) =>
    _$_FinancialRecord(
      id: json['id'] as int?,
      operationName: json['operationName'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      sum: (json['sum'] as num?)?.toDouble(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$$_FinancialRecordToJson(_$_FinancialRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationName': instance.operationName,
      'description': instance.description,
      'category': instance.category,
      'date': instance.date?.toIso8601String(),
      'sum': instance.sum,
      'status': instance.status,
    };
