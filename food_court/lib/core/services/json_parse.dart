import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/category_model.dart';

class JGJsonParese {

  static Future<List<JGCategoryModel>> getCategoryData() async {

    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2.将jsonString转成Map/List
    final result = json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final resultList = result["category"];
    List<JGCategoryModel> categorys = [];
    for (var json in resultList) {
        categorys.add(JGCategoryModel.fromJson(json));
    }

    return categorys;
  }



}