import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/profile_controller.dart';

PreferredSizeWidget costumHomeAppbar() {
  final ProfileController profileController = Get.find<ProfileController>();

  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: InkWell(
      onTap: () {
        Get.toNamed(
          '/ProfileScreen',
          arguments: {
            'nama': profileController.profile.value.enumerator.nama,
            'position': profileController.profile.value.enumerator.jabatan,
            'namaOpd': profileController.profile.value.enumerator.namaOpd,
            'email': profileController.profile.value.email,
          },
        );
      },
      child: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Obx(() {
                // Menampilkan nama dari ProfileModel secara reaktif
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hai ${profileController.profile.value.enumerator.nama}!',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${profileController.profile.value.enumerator.namaOpd}',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    ),
  );
}
