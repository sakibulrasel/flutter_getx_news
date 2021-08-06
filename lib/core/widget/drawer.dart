import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by sakibul.haque on 21,June,2021
 */

getAppDrawer(){
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("News Headling"),
          onTap: (){
            Get.toNamed("/news_headline");
          },
          leading: Icon(Icons.view_headline),
        ),
        ListTile(
          title: Text("Search News"),
          onTap: (){
            Get.toNamed("/search_news");
          },
          leading: Icon(Icons.search),
        )
      ],
    ),
  );
}