// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid19_week_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Covid19WeekModel _$Covid19WeekModelFromJson(Map<String, dynamic> json) {
  return Covid19WeekModel(
    status: json['status'] as int,
    type: json['type'] as String,
    data: json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Covid19WeekModelToJson(Covid19WeekModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'data': instance.data,
    };
