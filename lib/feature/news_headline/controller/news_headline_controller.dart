import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';
import 'package:news_app/core/repository/news_repository.dart';

/**
 * Created by sakibul.haque on 21,June,2021
 */

class NewsHeadlineController extends GetxController{
    NewsRepository _newsRepository;

    NewsHeadlineController(){
      _newsRepository = Get.find<NewsRepoImpl>();
      loadNewsHeadline();
    }

    RxBool isLoading = false.obs;



    RxList<Article> articles;

    loadNewsHeadline() async{
      showLoading();
      final result =  await _newsRepository.getNewsHeadline();
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