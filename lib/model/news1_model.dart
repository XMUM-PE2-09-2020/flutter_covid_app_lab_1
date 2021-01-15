import 'package:json_annotation/json_annotation.dart'; 
  
part 'news1_model.g.dart';


@JsonSerializable()
  class News1Model extends Object {

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'totalResults')
  int totalResults;

  @JsonKey(name: 'articles')
  List<Articles> articles;

  News1Model(this.status,this.totalResults,this.articles,);

  factory News1Model.fromJson(Map<String, dynamic> srcJson) => _$News1ModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$News1ModelToJson(this);

}

  
@JsonSerializable()
  class Articles extends Object {

  @JsonKey(name: 'source')
  Source source;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'urlToImage')
  String urlToImage;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  @JsonKey(name: 'content')
  String content;

  Articles(this.source,this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content,);

  factory Articles.fromJson(Map<String, dynamic> srcJson) => _$ArticlesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

}

  
@JsonSerializable()
  class Source extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  Source(this.id,this.name,);

  factory Source.fromJson(Map<String, dynamic> srcJson) => _$SourceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

}

  
