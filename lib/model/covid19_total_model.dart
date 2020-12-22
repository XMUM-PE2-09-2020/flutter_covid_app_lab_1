import 'package:json_annotation/json_annotation.dart'; 
  
part 'covid19_total_model.g.dart';


@JsonSerializable()
  class Covid19TotalModel extends Object{

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Data data;

  Covid19TotalModel(this.status,this.type,this.data,);

  factory Covid19TotalModel.fromJson(Map<String, dynamic> srcJson) => _$Covid19TotalModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Data extends Object{

  @JsonKey(name: 'summary')
  Summary summary;

  @JsonKey(name: 'change')
  Change change;

  Data(this.summary,this.change,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
@JsonSerializable()
  class Summary extends Object {

  @JsonKey(name: 'total_cases')
  int totalCases;

  @JsonKey(name: 'active_cases')
  int activeCases;

  @JsonKey(name: 'deaths')
  int deaths;

  @JsonKey(name: 'recovered')
  int recovered;

  @JsonKey(name: 'critical')
  int critical;

  @JsonKey(name: 'tested')
  int tested;

  @JsonKey(name: 'death_ratio')
  double deathRatio;

  @JsonKey(name: 'recovery_ratio')
  double recoveryRatio;

  Summary(this.totalCases,this.activeCases,this.deaths,this.recovered,this.critical,this.tested,this.deathRatio,this.recoveryRatio,);

  factory Summary.fromJson(Map<String, dynamic> srcJson) => _$SummaryFromJson(srcJson);

}

  
@JsonSerializable()
  class Change extends Object {

  @JsonKey(name: 'total_cases')
  int totalCases;

  @JsonKey(name: 'active_cases')
  int activeCases;

  @JsonKey(name: 'deaths')
  int deaths;

  @JsonKey(name: 'recovered')
  int recovered;

  @JsonKey(name: 'critical')
  int critical;

  @JsonKey(name: 'tested')
  int tested;

  @JsonKey(name: 'death_ratio')
  double deathRatio;

  @JsonKey(name: 'recovery_ratio')
  double recoveryRatio;

  Change(this.totalCases,this.activeCases,this.deaths,this.recovered,this.critical,this.tested,this.deathRatio,this.recoveryRatio,);

  factory Change.fromJson(Map<String, dynamic> srcJson) => _$ChangeFromJson(srcJson);

}

  
