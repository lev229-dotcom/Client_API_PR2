// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financialrecord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FinancialRecord _$FinancialRecordFromJson(Map<String, dynamic> json) {
  return _FinancialRecord.fromJson(json);
}

/// @nodoc
mixin _$FinancialRecord {
  int? get id => throw _privateConstructorUsedError;
  String? get operationName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  double? get sum => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialRecordCopyWith<FinancialRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialRecordCopyWith<$Res> {
  factory $FinancialRecordCopyWith(
          FinancialRecord value, $Res Function(FinancialRecord) then) =
      _$FinancialRecordCopyWithImpl<$Res, FinancialRecord>;
  @useResult
  $Res call(
      {int? id,
      String? operationName,
      String? description,
      String? category,
      DateTime? date,
      double? sum,
      bool? status});
}

/// @nodoc
class _$FinancialRecordCopyWithImpl<$Res, $Val extends FinancialRecord>
    implements $FinancialRecordCopyWith<$Res> {
  _$FinancialRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? operationName = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? date = freezed,
    Object? sum = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      operationName: freezed == operationName
          ? _value.operationName
          : operationName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sum: freezed == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FinancialRecordCopyWith<$Res>
    implements $FinancialRecordCopyWith<$Res> {
  factory _$$_FinancialRecordCopyWith(
          _$_FinancialRecord value, $Res Function(_$_FinancialRecord) then) =
      __$$_FinancialRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? operationName,
      String? description,
      String? category,
      DateTime? date,
      double? sum,
      bool? status});
}

/// @nodoc
class __$$_FinancialRecordCopyWithImpl<$Res>
    extends _$FinancialRecordCopyWithImpl<$Res, _$_FinancialRecord>
    implements _$$_FinancialRecordCopyWith<$Res> {
  __$$_FinancialRecordCopyWithImpl(
      _$_FinancialRecord _value, $Res Function(_$_FinancialRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? operationName = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? date = freezed,
    Object? sum = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_FinancialRecord(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      operationName: freezed == operationName
          ? _value.operationName
          : operationName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sum: freezed == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FinancialRecord implements _FinancialRecord {
  const _$_FinancialRecord(
      {this.id,
      this.operationName,
      this.description,
      this.category,
      this.date,
      this.sum,
      this.status});

  factory _$_FinancialRecord.fromJson(Map<String, dynamic> json) =>
      _$$_FinancialRecordFromJson(json);

  @override
  final int? id;
  @override
  final String? operationName;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final DateTime? date;
  @override
  final double? sum;
  @override
  final bool? status;

  @override
  String toString() {
    return 'FinancialRecord(id: $id, operationName: $operationName, description: $description, category: $category, date: $date, sum: $sum, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FinancialRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.operationName, operationName) ||
                other.operationName == operationName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, operationName, description, category, date, sum, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinancialRecordCopyWith<_$_FinancialRecord> get copyWith =>
      __$$_FinancialRecordCopyWithImpl<_$_FinancialRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FinancialRecordToJson(
      this,
    );
  }
}

abstract class _FinancialRecord implements FinancialRecord {
  const factory _FinancialRecord(
      {final int? id,
      final String? operationName,
      final String? description,
      final String? category,
      final DateTime? date,
      final double? sum,
      final bool? status}) = _$_FinancialRecord;

  factory _FinancialRecord.fromJson(Map<String, dynamic> json) =
      _$_FinancialRecord.fromJson;

  @override
  int? get id;
  @override
  String? get operationName;
  @override
  String? get description;
  @override
  String? get category;
  @override
  DateTime? get date;
  @override
  double? get sum;
  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_FinancialRecordCopyWith<_$_FinancialRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
