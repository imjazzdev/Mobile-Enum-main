import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_enum/costumview/cv_button_submit.dart';
import 'package:mobile_enum/costumview/cv_clicktext.dart';
import 'package:mobile_enum/costumview/cv_input.dart';
import 'package:mobile_enum/data/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controllerLogin = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white ,
          onPressed: (){
            Get.back();
          },
          ),
          title: const Text("Kembali", style: TextStyle(fontSize:16, color:  Colors.white),),
          backgroundColor: Colors.purple,
      ),
      
      body: SingleChildScrollView(
        child: Container(
          color: Colors.purple,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "Masuk Akun",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text(
                            "Ayo! Kumpulkan data sektoral dengan mudah.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14
                            ),   
                          ),
                          SizedBox(
                            width: 500,
                            height: 200,
                            child: Image.asset(
                              'assets/images/login.png'
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          inputBox(
                            label: "Username",
                            hint: "Masukkan Username",
                            controller: controllerLogin.username),
                          
                          const SizedBox(
                              height: 20,
                            ),

                          inputBox(
                            label: "Password",
                            hint: "Masukkan Password",
                            controller: controllerLogin.password
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                submitButton(
                  text: "Masuk",
                  ontap: (){
                    print("ini tekan masuk");
                    controllerLogin.submitLogin();
                  }
                ),
                clickText(
                  text: "Lupa password?",
                  ontap: (){
                    print("ini tekan lupa password");
                    
                  })               
              ],
            ),
          ),
        ),
      ),
    );
  }
}