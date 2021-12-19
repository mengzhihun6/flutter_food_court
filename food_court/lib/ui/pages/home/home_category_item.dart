import 'package:flutter/material.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/extension/int_extension.dart';
import 'package:food_court/ui/pages/meal/meal.dart';


class JGHomeCategoryItem extends StatelessWidget {

  final JGCategoryModel _category;

  JGHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;

    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.px),
              gradient: LinearGradient(
                  colors: [
                    bgColor.withOpacity(0.5),
                    bgColor
                  ]
              )
          ),
          alignment: Alignment.center,
          child: Text(_category.title,style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.bold),)
      ),

      onTap: (){
        Navigator.of(context).pushNamed(JGMealScreen.routeName,arguments: _category);
      },
    );
  }
}
