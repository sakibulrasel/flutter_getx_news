import 'package:get/get.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';
import 'package:news_app/core/repository/news_repository.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';

/**
 * Created by sakibul.haque on 21,June,2021
 */

class NewsHeadlineBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }

}