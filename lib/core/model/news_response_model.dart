/**
 * Created by sakibul.haque on 20,June,2021
 */
import "package:json_annotation/json_annotation.dart";
import 'package:news_app/core/model/article.dart';

part 'news_response_model.g.dart';

@JsonSerializable(nullable: false)
class NewsResponse {

  NewsResponse();

  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "totalResults")
  int totalResults;

  @JsonKey(name:"articles")
  List<Article> articles;


  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);

}