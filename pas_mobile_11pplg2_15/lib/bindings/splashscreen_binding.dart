import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/show_controller.dart';
import 'package:pas_mobile_11pplg2_15/controller/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}