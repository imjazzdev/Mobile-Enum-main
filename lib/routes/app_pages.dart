import 'package:get/get.dart';
import 'package:mobile_enum/routes/app_routes.dart';
import 'package:mobile_enum/ui/login/login_screen.dart';
import 'package:mobile_enum/ui/splash/splash_screen.dart';

import '../ui/detail/detail_screen.dart';

import '../ui/home/home_screen.dart';
import '../ui/navbar/navbar.dart';
import '../ui/profile/profile_screen.dart';
import '../ui/splash/start_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.startScreen, page: () => const StartScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.navbarScreen, page: () => const NavbarScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.detailScreen, page: () => DetailScreen()),
  ];
}
