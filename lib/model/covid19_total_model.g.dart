// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid19_total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Covid19TotalModel _$Covid19TotalModelFromJson(Map<String, dynamic> json) {
  return Covid19TotalModel(
      json['status'] as int,
      json['type'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

// Map<String, dynamic> _$Covid19TotalModelToJson(Covid19TotalModel instance) =>
//     <String, dynamic>{
//       'status': instance.status,
//       'type': instance.type,
//       'data': instance.data,
//     };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
      json['change'] == null
          ? null
          : Change.fromJson(json['change'] as Map<String, dynamic>));
}

// Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
//       'summary': instance.summary,
//       'change': instance.change,
//     };

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
      json['total_cases'] as int,
      json['active_cases'] as int,
      json['deaths'] as int,
      json['recovered'] as int,
      json['critical'] as int,
      json['tested'] as int,
      (json['death_ratio'] as num)?.toDouble(),
      (json['recovery_ratio'] as num)?.toDouble());
}

// Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
//       'total_cases': instance.totalCases,
//       'active_cases': instance.activeCases,
//       'deaths': instance.deaths,
//       'recovered': instance.recovered,
//       'critical': instance.critical,
//       'tested': instance.tested,
//       'death_ratio': instance.deathRatio,
//       'recovery_ratio': instance.recoveryRatio,
//     };

Change _$ChangeFromJson(Map<String, dynamic> json) {
  return Change(
      json['total_cases'] as int,
      json['active_cases'] as int,
      json['deaths'] as int,
      json['recovered'] as int,
      json['critical'] as int,
      json['tested'] as int,
      (json['death_ratio'] as num)?.toDouble(),
      (json['recovery_ratio'] as num)?.toDouble());
}

// Map<String, dynamic> _$ChangeToJson(Change instance) => <String, dynamic>{
//       'total_cases': instance.totalCases,
//       'active_cases': instance.activeCases,
//       'deaths': instance.deaths,
//       'recovered': instance.recovered,
//       'critical': instance.critical,
//       'tested': instance.tested,
//       'death_ratio': instance.deathRatio,
//       'recovery_ratio': instance.recoveryRatio,
//     };
