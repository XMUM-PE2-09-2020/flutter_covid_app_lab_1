import 'package:json_annotation/json_annotation.dart'; 
  
part 'covid19_notify_model.g.dart';


@JsonSerializable()
  class Covid19NotifyModel extends Object {

  @JsonKey(name: 'latest')
  Latest latest;

  @JsonKey(name: 'locations')
  List<Locations> locations;

  Covid19NotifyModel(this.latest,this.locations,);

  factory Covid19NotifyModel.fromJson(Map<String, dynamic> srcJson) => _$Covid19NotifyModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Latest extends Object {

  @JsonKey(name: 'confirmed')
  int confirmed;

  @JsonKey(name: 'deaths')
  int deaths;

  Latest(this.confirmed,this.deaths,);

  factory Latest.fromJson(Map<String, dynamic> srcJson) => _$LatestFromJson(srcJson);

}

  
@JsonSerializable()
  class Locations extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'county')
  String county;

  @JsonKey(name: 'fips')
  String fips;

  @JsonKey(name: 'last_updated')
  String lastUpdated;

  @JsonKey(name: 'latest')
  Latest latest;

  Locations(this.id,this.country,this.state,this.county,this.fips,this.lastUpdated,this.latest,);

  factory Locations.fromJson(Map<String, dynamic> srcJson) => _$LocationsFromJson(srcJson);

}

  


  
