import 'package:json_annotation/json_annotation.dart'; 
  
part 'covid19_week_model.g.dart';


@JsonSerializable()
class Covid19WeekModel{

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Map data;

  Covid19WeekModel({this.status,this.type
  ,this.data
  });

  factory Covid19WeekModel.fromJson(Map<String, dynamic> srcJson) => _$Covid19WeekModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Covid19WeekModelToJson(this);
}

  


  
