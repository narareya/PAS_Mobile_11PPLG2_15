import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/show_page.dart';

class MainController extends GetxController { 
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    ShowPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}