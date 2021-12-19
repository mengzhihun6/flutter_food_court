import 'package:flutter/material.dart';

class JGCategoryModel {
  String id;
  String title;
  String color;
  Color cColor;

  JGCategoryModel({this.id, this.title, this.color});

  JGCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1.将color转成十六进制的数字
    final colorInt = int.parse(color, radix: 16);
    // 2.将透明度加进去
    cColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}

