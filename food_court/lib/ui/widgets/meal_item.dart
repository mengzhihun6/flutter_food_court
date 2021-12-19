import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/extension/int_extension.dart';
import 'package:food_court/core/viewmodel/favor_view_model.dart';
import 'package:food_court/ui/pages/detail/detail.dart';
import 'package:food_court/ui/widgets/operation_item.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class JGMealItem extends StatelessWidget {
  final JGMealModel _meal;

  JGMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(context),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(JGDetailScreen.routeName, arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)),
          child: Image.network(
            _meal.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10.px,
          right: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.px)),
            child: Text(
              _meal.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JGOperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
          JGOperationItem(Icon(Icons.restaurant), "${_meal.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<JGFavorViewModel>(builder: (ctx, favorVM, child) {
      // 1.判断是否收藏状态
      final iconData =
          favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
      final favorColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
      final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";

      return GestureDetector(
        child: JGOperationItem(
          Icon(iconData, color: favorColor),
          title,
          textColor: favorColor,
        ),
        onTap: () {
          favorVM.handleMeal(_meal);
        },
      );
    });
  }
}
