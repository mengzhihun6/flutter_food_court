import 'package:flutter/material.dart';
import '../favor/favor.dart';
import '../home/home.dart';


final List<Widget> pages = [
  JGHomeScreen(),
  JGFavorScreen()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: "收藏", icon: Icon(Icons.star)),
];
