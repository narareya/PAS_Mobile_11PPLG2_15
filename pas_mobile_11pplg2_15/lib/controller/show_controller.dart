import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_15/model/show_model.dart';

class ShowController extends GetxController {
  var isLoading = false.obs;
  var listShows = <ShowModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchAPIShows();
  }

  Future<void> fetchAPIShows() async {
    const url = "https://api.tvmaze.com/shows";

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      print("status code "+ response.statusCode.toString());
      print("json response "+ response.body.toString());

      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List standings = data['table'];
        listShows.assignAll(standings.map((e) => ShowModel.fromJson(e),).toList());
      } else {
        Get.snackbar("Error", "Message error dari BE");
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    isLoading.value = false;
  }
}