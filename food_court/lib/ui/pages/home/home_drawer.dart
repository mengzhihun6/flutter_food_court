import 'package:flutter/material.dart';
import 'package:food_court/core/extension/int_extension.dart';
import 'package:food_court/ui/pages/filter/filter.dart';

class JGHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), "进餐", () {
              Navigator.of(context).pop();
            }),
            buildListTile(context, Icon(Icons.settings), "过滤", () {
              Navigator.of(context).pushNamed(JGFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      height: 120.px,
      width: double.infinity,
      color: Colors.orange,
      alignment: Alignment(0, 0.5),
      margin: EdgeInsets.only(bottom: 20.px),
      child: Text(
        "开始动手",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.display2,
      ),
      onTap: handler,
    );
  }
}
