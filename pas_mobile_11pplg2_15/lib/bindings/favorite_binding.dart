import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}