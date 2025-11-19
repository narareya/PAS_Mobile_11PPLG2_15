import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/dbHelper.dart';

class FavoriteController extends GetxController {
  final DBHelper db = DBHelper();
  
  var favoriteList = <Map<String, dynamic>>[].obs;

  Future<void> loadFavorites() async {
    var data = await db.getFavorites();
    favoriteList.assignAll(data);
  }

  Future<void> addFavorite(String title) async {
    await db.addFavorite(title);
    loadFavorites(); // refresh list
  }

  Future<void> deleteFavorite(int id) async {
    await db.deleteFavorite(id);
    loadFavorites(); // refresh list
  }
}