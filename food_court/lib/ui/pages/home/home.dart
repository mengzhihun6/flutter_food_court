import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/home/home_app_bar.dart';
import 'home_content.dart';

class JGHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JGHomeAppBar(context),
      body: JGHomeContent(),
    );
  }
}
