import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/detail_indikator_controller.dart';

class CoordinatButton extends StatefulWidget {
  final String btnText;

  const CoordinatButton({Key? key, required this.btnText}) : super(key: key);

  @override
  _CoordinatButtonState createState() => _CoordinatButtonState();
}

class _CoordinatButtonState extends State<CoordinatButton> {
  DetailIndikatorController detailIndikatorController = Get.find();
  String latitude = "-"; // Nilai awal latitude
  String longitude = "-"; // Nilai awal longitude

  void updateCoordinates() {
    setState(() {
      latitude = "NewLatValue"; // Ganti dengan nilai baru
      longitude = "NewLongValue"; // Ganti dengan nilai baru
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Titik Koordinat"),
                      Text(
                          "Latitude     : ${detailIndikatorController.latitude.value}"), // Menampilkan nilai latitude
                      Text(
                          "Longitude  : ${detailIndikatorController.longitude.value}"), // Menampilkan nilai longitude
                    ],
                  );
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // updateCoordinates(); // Memanggil fungsi untuk memperbarui koordinat
                  detailIndikatorController.getCurrentLocation();
                },
                child: Text(widget.btnText),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
