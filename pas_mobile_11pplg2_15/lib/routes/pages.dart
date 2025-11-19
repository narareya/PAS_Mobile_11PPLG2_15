import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg2_15/bindings/auth_binding.dart';
import 'package:pas_mobile_11pplg2_15/bindings/favorite_binding.dart';
import 'package:pas_mobile_11pplg2_15/bindings/main_binding.dart';
import 'package:pas_mobile_11pplg2_15/bindings/show_binding.dart';
import 'package:pas_mobile_11pplg2_15/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg2_15/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/main_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/show_page.dart';
import 'package:pas_mobile_11pplg2_15/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.mainPage, page: () => HomePage(), bindings: [MainBinding(), ShowBinding(), AuthBinding()]),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.showPage, page: () => ShowPage(), binding: ShowBinding()),
    GetPage(name: AppRoutes.favoritePage, page: () => FavoritePage(), binding: FavoriteBinding()),
    GetPage(name: AppRoutes.splashScreen, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
  ];
}