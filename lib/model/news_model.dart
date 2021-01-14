import 'package:json_annotation/json_annotation.dart'; 
  
part 'news_model.g.dart';


List<NewsModel> getNewsModelList(List<dynamic> list){
    List<NewsModel> result = [];
    list.forEach((item){
      result.add(NewsModel.fromJson(item));
    });
    return result;
  }
@JsonSerializable()
  class NewsModel extends Object {

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'notes')
  String notes;

  @JsonKey(name: 'covid19Site')
  String covid19Site;

  @JsonKey(name: 'covid19SiteSecondary')
  String covid19SiteSecondary;

  @JsonKey(name: 'covid19SiteTertiary')
  String covid19SiteTertiary;

  @JsonKey(name: 'covid19SiteQuaternary')
  String covid19SiteQuaternary;

  @JsonKey(name: 'covid19SiteQuinary')
  String covid19SiteQuinary;

  @JsonKey(name: 'twitter')
  String twitter;

  @JsonKey(name: 'covid19SiteOld')
  String covid19SiteOld;

  @JsonKey(name: 'covidTrackingProjectPreferredTotalTestUnits')
  String covidTrackingProjectPreferredTotalTestUnits;

  @JsonKey(name: 'covidTrackingProjectPreferredTotalTestField')
  String covidTrackingProjectPreferredTotalTestField;

  @JsonKey(name: 'totalTestResultsField')
  String totalTestResultsField;

  @JsonKey(name: 'pui')
  String pui;

  @JsonKey(name: 'pum')
  bool pum;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fips')
  String fips;

  NewsModel(this.state,this.notes,this.covid19Site,this.covid19SiteSecondary,this.covid19SiteTertiary,this.covid19SiteQuaternary,this.covid19SiteQuinary,this.twitter,this.covid19SiteOld,this.covidTrackingProjectPreferredTotalTestUnits,this.covidTrackingProjectPreferredTotalTestField,this.totalTestResultsField,this.pui,this.pum,this.name,this.fips,);

  factory NewsModel.fromJson(Map<String, dynamic> srcJson) => _$NewsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

}

  
