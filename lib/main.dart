import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mobile_enum/data/controller/login_controller.dart';
import 'package:mobile_enum/data/controller/profile_controller.dart';
import 'package:mobile_enum/routes/app_pages.dart';

import 'data/controller/dashboard_controller.dart';
import 'data/controller/dashboard_indikator_controller.dart';
import 'data/controller/detail_indikator_controller.dart';
import 'routes/app_routes.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
  Get.put(ProfileController());
  Get.put(DashboardController());
  Get.put(DashboardIndikatorController());
  Get.put(DetailIndikatorController());
  Get.put(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // home: const SplashScreen(),
        // initialRoute: '/SplashScreen',
        initialRoute: AppRoutes.splashScreen,
        getPages: AppPages.pages);
  }
}
