import 'package:flutter/material.dart';
import 'package:food_court/core/extension/int_extension.dart';
import 'package:food_court/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class JGFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiceTitle(context),
        buildChoiceSelect()
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        "展示你的选择",
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<JGFilterViewModel>(
        builder: (ctx,filterVM,child) {
          return ListView(
            children: [
              buildListTile("五谷蛋白", "展示五谷蛋白食物", filterVM.isGlutenFree, (value){
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "展示不含乳糖食物", filterVM.isLactoseFree, (value){
                filterVM.isLactoseFree = value;
              }),
              buildListTile("素食主义", "展示素食主义食物", filterVM.isVegetarian, (value){
                filterVM.isVegetarian = value;
              }),
              buildListTile("严格素食主义", "展示严格素食主义食物", filterVM.isVegan, (value){
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );

  }

  Widget buildListTile(String title, String subtitle, bool value, Function onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value,onChanged: onChange,),
    );
  }
}
