import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/home/home_drawer.dart';
import 'package:food_court/ui/pages/main/initialize_items.dart';
import 'package:food_court/core/extension/int_extension.dart';



class JGMainScreen extends StatefulWidget {

  static const String routeName = "/";

  @override
  _JGMainScreenState createState() => _JGMainScreenState();
}

class _JGMainScreenState extends State<JGMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: JGHomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14.px,
        unselectedFontSize: 14.px,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
