import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';
import 'package:news_app/core/repository/news_repository.dart';

/**
 * Created by sakibul.haque on 21,June,2021
 */

class SearchNewsController extends GetxController{
    NewsRepository _newsRepository;

    SearchNewsController(){
      _newsRepository = Get.find<NewsRepoImpl>();
      searchTextController.addListener(() {
        if(searchTextController.text.length>2){
          searchNewsHeadline();
        }
      });
    }

    final searchTextController = TextEditingController();

    RxBool isLoading = false.obs;

    RxList<Article> articles = RxList();

    searchNewsHeadline() async{
      showLoading();
      final result = await _newsRepository.getSearchedNews(searchTextController.text);
      hideLoading();

      if(result !=null){
        articles = result.obs;
      }else{
        print("No Data Found");
      }
    }

    showLoading(){
      isLoading.toggle();
    }

    hideLoading(){
      isLoading.toggle();
    }
}