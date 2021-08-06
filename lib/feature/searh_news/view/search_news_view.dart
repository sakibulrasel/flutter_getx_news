/**
 * Created by sakibul.haque on 21,June,2021
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/widget/drawer.dart';
import 'package:news_app/feature/searh_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {

  final controller = Get.find<SearchNewsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search)
            ),
          ),
          Expanded(
            child: Obx((){
                return controller.isLoading.isTrue ?
                    Center(
                      child: CircularProgressIndicator(),
                    ):controller.articles.isEmpty?
                    Center(
                      child: Text("No News Found"),
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
          )
        ],

      ),
    );
  }
}
