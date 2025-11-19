import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));

    final token = prefs.getString("token");

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.mainPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}