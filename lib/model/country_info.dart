class CountryInfo {
  int id;
  double lat;
  double long;

  CountryInfo({this.id, this.lat, this.long});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      id: json['_id'] as int,
      lat: json['lat'].toDouble(),
      long: json['long'].toDouble(),
    );
  }
}
