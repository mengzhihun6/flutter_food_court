import 'package:flutter/material.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/services/json_parse.dart';
import 'package:food_court/core/extension/int_extension.dart';
import 'home_category_item.dart';


class JGHomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JGCategoryModel>>(
      future: JGJsonParese.getCategoryData(),
        builder: (ctx,snapShot) {
       if(!snapShot.hasData) return CircularProgressIndicator();
       if(snapShot.error != null) return Center(child: Text("请求失败"));

       final categorys = snapShot.data;
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categorys.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.px,
              mainAxisSpacing: 20.px,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (ctx,index) {
              return JGHomeCategoryItem(categorys[index]);
            }
        );
        }
    );
  }
}

