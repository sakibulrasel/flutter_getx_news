import 'package:get/get.dart';
import 'package:news_app/feature/searh_news/controller/search_news_controller.dart';

/**
 * Created by sakibul.haque on 21,June,2021
 */

class SearchNewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }

}