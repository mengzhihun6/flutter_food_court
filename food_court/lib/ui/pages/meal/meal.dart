import 'package:flutter/material.dart';
import 'package:food_court/core/model/category_model.dart';

import 'meal_content.dart';

class JGMealScreen extends StatelessWidget {
static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context).settings.arguments as JGCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: JGMealContent(),
    );
  }
}
