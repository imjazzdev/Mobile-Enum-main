import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_enum/ui/login/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
                child: Column(
                  children: [
                    SizedBox(width: 328,height: 360.16,
                    child: Column(
                      children: [
                        Image.asset('assets/images/start.png'),
                        const SizedBox(height: 20,),
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Selamat datang, Enumerator!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                               "Mulai pendataan sektoral di Gorontalo dengan mudah. Cek dan input data secara offline dan online untuk mendukung survei door-to-door",
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 14),
                              )
                          ],
                        )
                      ],
                    ),)
                  ],
                ),
              ),
            ),
          Container(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[600],
                ),
                child: const Text(
                  "Mulai",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),  
      ),
    );
  }
}