import 'country_info.dart';

class CountryCases {
  int id;
  String country;
  double lat;
  double long;
  int todayCases;
  int active;
  int recovered;
  int death;

  CountryCases(
      {this.id,
      this.active,
      this.country,
      this.death,
      this.recovered,
      this.todayCases,
      this.lat,
      this.long});

  factory CountryCases.fromJson(Map<String, dynamic> json) {
    return CountryCases(
        id: CountryInfo.fromJson(json['countryInfo']).id,
        country: json['country'] as String,
        todayCases: json['todayCases'] as int,
        active: json['active'] as int,
        recovered: json['recovered'] as int,
        death: json['death'] as int,
        lat: CountryInfo.fromJson(json['countryInfo']).lat,
        long: CountryInfo.fromJson(json['countryInfo']).long);
  }
}
