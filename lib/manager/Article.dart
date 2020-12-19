import 'dart:convert';

import 'package:flutter/material.dart';

class Article {

  final String articleId;
  final String articleTitle;
  final String articlePic;
  final String userName;
  final String count;

  //构造函数
  Article({
    this.articleId,
    this.articleTitle,
    this.articlePic,
    this.userName,
    this.count,
  });

  //string =》 List<Article>
  static List<Article> resolveDataFromJsonString(String json) {
    List<Article> listModel = new List<Article>();
    List list = jsonDecode(json)['list'];
    list.forEach((element) {
      var model = new Article(
        articleId: element['articleId'],
        articleTitle: element['articleTitle'],
        articlePic: element['articlePic'],
        userName: element['userName'],
        count: element['count'],
      );
      listModel.add(model);
    });

    return listModel;
  }

}