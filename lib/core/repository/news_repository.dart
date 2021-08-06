import 'package:news_app/core/model/article.dart';

/**
 * Created by sakibul.haque on 20,June,2021
 */

abstract class NewsRepository{
   Future<List<Article>> getNewsHeadline();
   Future<List<Article>> getSearchedNews(String query);
}