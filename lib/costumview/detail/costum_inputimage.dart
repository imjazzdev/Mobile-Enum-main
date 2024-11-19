import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../data/controller/detail_indikator_controller.dart';

class CostumInputGambar extends StatefulWidget {
  final String label;
  const CostumInputGambar({super.key, required this.label});
  // const CostumInputGambar({
  //   Key? key,
  //   required this.label,
  // }) : super(key: key);

  @override
  State<CostumInputGambar> createState() => _CostumInputGambarState();
}

class _CostumInputGambarState extends State<CostumInputGambar> {
  DetailIndikatorController detailIndikatorController = Get.find();
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  // Future<void>

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          // margin: EdgeInsets.only(top: 20),
          height: 70,
          // color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //BUTTON INPUT GAMBAR
              GestureDetector(
                onTap: () {
                  Get.find<DetailIndikatorController>()
                      .showImageSourceSnackbar();
                },
                child: Container(
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              //HASIL INPUT GAMBAR
              Expanded(
                child: Obx(() {
                  if (detailIndikatorController.locationImages.isEmpty) {
                    return Center(
                      child: Text(
                        "Belum ada gambar",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: detailIndikatorController.locationImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: FileImage(detailIndikatorController
                                    .locationImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                detailIndikatorController.removeImage(index);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(.7),
                                radius: 12,
                                child: Icon(Icons.close,
                                    size: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
