import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pas_mobile_11pplg2_15/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_15/controller/show_controller.dart';
import 'package:pas_mobile_11pplg2_15/widget/widget_components.dart';

class ShowPage extends StatelessWidget {
  ShowPage({super.key});
  final controller = Get.find<ShowController>();
  final favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TV Shows"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator(),);
            }

            return RefreshIndicator(
              child: ListView.builder(
                itemCount: controller.listShows.length,
                itemBuilder: (context, index) {
                  final show = controller.listShows[index];
                  return ShowCard(
                    title: show.name, 
                    image: show.image?.medium ?? "https://via.placeholder.com/60", 
                    onBookmark: () {
                      favoriteController.addFavorite(show.id, show.name, show.image?.medium ?? "https://via.placeholder.com/60");

                      Get.snackbar("Bookmark", "${show.name} ditambahkan",
                      backgroundColor: Colors.deepPurpleAccent,
                      colorText: Colors.white);
                    });
                }), 
              onRefresh: () async {
                await controller.fetchAPIShows();
              });
        }
      )),
    );
  }
}