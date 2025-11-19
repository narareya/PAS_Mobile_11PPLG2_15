import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_15/widget/widget_components.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    // Load data saat page dibuka
    controller.loadFavorites();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite TV Shows"),
      ),
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada favorit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            final item = controller.favoriteList[index];
            return FavoriteCard(
              item: item,
              onDelete: () {
                controller.deleteFavorite(item['id']);
                Get.snackbar("Berhasil", "Favorite dihapus",
                  backgroundColor: Colors.deepPurpleAccent,
                  colorText: Colors.white
                );
              },
            );
          },
        );
      }),
    );
  }
}
