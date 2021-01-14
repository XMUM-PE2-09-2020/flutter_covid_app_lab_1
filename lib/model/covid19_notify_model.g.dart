// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid19_notify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Covid19NotifyModel _$Covid19NotifyModelFromJson(Map<String, dynamic> json) {
  return Covid19NotifyModel(
      json['latest'] == null
          ? null
          : Latest.fromJson(json['latest'] as Map<String, dynamic>),
      (json['locations'] as List)
          ?.map((e) =>
              e == null ? null : Locations.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

// Map<String, dynamic> _$Covid19NotifyModelToJson(Covid19NotifyModel instance) =>
//     <String, dynamic>{
//       'latest': instance.latest,
//       'locations': instance.locations,
//     };

Latest _$LatestFromJson(Map<String, dynamic> json) {
  return Latest(json['confirmed'] as int, json['deaths'] as int);
}

// Map<String, dynamic> _$LatestToJson(Latest instance) => <String, dynamic>{
//       'confirmed': instance.confirmed,
//       'deaths': instance.deaths,
//     };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      json['id'] as String,
      json['country'] as String,
      json['state'] as String,
      json['county'] as String,
      json['fips'] as String,
      json['last_updated'] as String,
      json['latest'] == null
          ? null
          : Latest.fromJson(json['latest'] as Map<String, dynamic>));
}

// Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
//       'id': instance.id,
//       'country': instance.country,
//       'state': instance.state,
//       'county': instance.county,
//       'fips': instance.fips,
//       'last_updated': instance.lastUpdated,
//       'latest': instance.latest,
//     };
