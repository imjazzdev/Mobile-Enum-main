import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../costumview/cv_clicktext.dart';
import '../../data/model/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // final ProfileModel profile = profileList[0];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 15),
                                child: BackButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child: Text(
                                  "Profile Enumerator",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Profile
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(top: 80),
                      child: const CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 95,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.purple[900],
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${data['nama']}',
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "Position",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Icon(
                              Icons.groups_outlined,
                              color: Colors.purple[900],
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${data['position']}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "OPD",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          const SizedBox(width: 10),
                          Icon(
                            Icons.apartment,
                            color: Colors.purple[900],
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              '${data['namaOpd']}',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          const SizedBox(width: 10),
                          Icon(
                            Icons.email_outlined,
                            color: Colors.purple[900],
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              '${data['email']}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: clickText(text: "Reset Kata Sandi", ontap: () {}),
                // child: Container(
                //     alignment: Alignment.center,
                //     color: Colors.amber,
                //     child: clickText(text: "Reset Kata Sandi", ontap: () {})),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
