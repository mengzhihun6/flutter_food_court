import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/ui/pages/detail/detail_content.dart';

import 'detail_floating_button.dart';

class JGDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as JGMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: JGDetailContent(meal),
      floatingActionButton: JGDetailFloatingButton(),
    );
  }
}
