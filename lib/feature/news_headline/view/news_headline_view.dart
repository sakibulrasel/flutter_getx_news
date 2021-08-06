/**
 * Created by sakibul.haque on 21,June,2021
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/widget/drawer.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {

  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx((){
        return controller.isLoading.isTrue ?
        Center(
          child: CircularProgressIndicator(),
        ):Container(
          margin: EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.articles[index].imageUrl==null?Container():
                    Image.network(controller.articles[index].imageUrl),
                    SizedBox(height: 4,),
                    Text(controller.articles[index].title==null?"":controller.articles[index].title),
                    SizedBox(height: 4,),
                    Text(controller.articles[index].desc==null?"":controller.articles[index].desc)
                  ],
                );
              },
              separatorBuilder: (context,index)=>Divider(),
              itemCount: controller.articles.length
          ),
        );
      }),
    );
  }
}
