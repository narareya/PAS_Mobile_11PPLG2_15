import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pas_mobile_11pplg2_15/controller/show_controller.dart';

class ShowPage extends StatelessWidget {
  ShowPage({super.key});
  final controller = Get.find<ShowController>();

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
                  return Card(
                    child: ListTile(
                      title: Text(show.name),
                      leading: Image(image: NetworkImage(show.image as String),),
                    ),
                  );
                }), 
              onRefresh: () async {
                await controller.fetchAPIShows();
              });
        }
      )),
    );
  }
}