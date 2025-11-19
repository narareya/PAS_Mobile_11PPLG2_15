import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/dbHelper.dart';

class FavoriteController extends GetxController {
  final DBHelper db = DBHelper();
  
  var favoriteList = <Map<String, dynamic>>[].obs;

  Future<void> fetchFavorites() async {
    await loadFavorites();
  }

  Future<void> loadFavorites() async {
    var data = await db.getFavorites();
    print("DEBUG DB DATA: $data");
    favoriteList.assignAll(data);
  }

  Future<void> addFavorite(int id, String title, String image) async {
    await db.addFavorite(id, title, image);
    loadFavorites(); // refresh list
  }

  Future<void> deleteFavorite(int id) async {
    await db.deleteFavorite(id);
    loadFavorites(); // refresh list
  }
}