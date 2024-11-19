import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_enum/ui/splash/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const StartScreen()); 
      print("ini selesai splash");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'), 
            const SizedBox(height: 16.0),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
