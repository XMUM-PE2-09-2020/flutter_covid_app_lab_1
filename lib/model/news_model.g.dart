// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    json['state'] as String,
    json['notes'] as String,
    json['covid19Site'] as String,
    json['covid19SiteSecondary'] as String,
    json['covid19SiteTertiary'] as String,
    json['covid19SiteQuaternary'] as String,
    json['covid19SiteQuinary'] as String,
    json['twitter'] as String,
    json['covid19SiteOld'] as String,
    json['covidTrackingProjectPreferredTotalTestUnits'] as String,
    json['covidTrackingProjectPreferredTotalTestField'] as String,
    json['totalTestResultsField'] as String,
    json['pui'] as String,
    json['pum'] as bool,
    json['name'] as String,
    json['fips'] as String,
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'state': instance.state,
      'notes': instance.notes,
      'covid19Site': instance.covid19Site,
      'covid19SiteSecondary': instance.covid19SiteSecondary,
      'covid19SiteTertiary': instance.covid19SiteTertiary,
      'covid19SiteQuaternary': instance.covid19SiteQuaternary,
      'covid19SiteQuinary': instance.covid19SiteQuinary,
      'twitter': instance.twitter,
      'covid19SiteOld': instance.covid19SiteOld,
      'covidTrackingProjectPreferredTotalTestUnits':
          instance.covidTrackingProjectPreferredTotalTestUnits,
      'covidTrackingProjectPreferredTotalTestField':
          instance.covidTrackingProjectPreferredTotalTestField,
      'totalTestResultsField': instance.totalTestResultsField,
      'pui': instance.pui,
      'pum': instance.pum,
      'name': instance.name,
      'fips': instance.fips,
    };
