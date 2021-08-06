import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/news_headline/binding/NewsHeadlineBinding.dart';
import 'package:news_app/feature/news_headline/view/news_headline_view.dart';
import 'package:news_app/feature/searh_news/binding/search_news_binding.dart';
import 'package:news_app/feature/searh_news/view/search_news_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/news_headline", page:()=> NewsHeadlineView(),binding: NewsHeadlineBinding()),
        GetPage(name: "/search_news", page:()=> SearchNewsView(),binding: SearchNewsBinding()),
      ],
      initialRoute: "/news_headline",
    );
  }
}
