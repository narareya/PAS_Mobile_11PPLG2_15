import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/main_controller.dart';

class HomePage extends StatelessWidget {
  final mainController = Get.find<MainController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(title: Text("My Menu"),),
      body: mainController.pages[mainController
      .selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        onTap: mainController.changePage,
        currentIndex: mainController.selectedIndex.value,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Shows"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    ));
  }
}