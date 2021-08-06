import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/model/news_response_model.dart';
import 'package:news_app/core/repository/news_repository.dart';
import 'package:news_app/service/http_service.dart';
import 'package:news_app/service/http_service_implementation.dart';

/**
 * Created by sakibul.haque on 20,June,2021
 */

class NewsRepoImpl implements NewsRepository{

  HttpService _httpService;

  NewsRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }
  @override
  Future<List<Article>> getNewsHeadline() async {

    try {
      final response = await _httpService.getRequest("/v2/top-headlines?country=us");

      final parseResponse = NewsResponse.fromJson(response.data);

      return parseResponse.articles;
      
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");

      final parseResponse = NewsResponse.fromJson(response.data);

      return parseResponse.articles;

    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
  
  
}