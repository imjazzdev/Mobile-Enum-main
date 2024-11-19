import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_enum/costumview/cv_button_submit.dart';
import 'package:mobile_enum/costumview/detail/costumD_input_box.dart';
import 'package:mobile_enum/costumview/detail/costum_coordinatBtn.dart';
import 'package:mobile_enum/costumview/detail/costum_dropdown.dart';
import 'package:mobile_enum/costumview/detail/costum_inputfile.dart';
import 'package:mobile_enum/costumview/detail/costum_inputimage.dart';
import 'package:mobile_enum/data/controller/detail_indikator_controller.dart';
import 'package:mobile_enum/data/model/region_unit_model.dart';

import '../../costumview/detail/costum_datepicker.dart';
import '../../costumview/detail/costum_timepicker.dart';
import '../../data/model/dashboard_indikator_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailIndikatorController detailIndikatorController =
      DetailIndikatorController();
  final data = Get.arguments as DashboardIndikatorModel;

  // Mengisi Kecamatan Berdasarkan Kabupaten
  List<DropdownMenuItem<String>> _buildKecamatanItems(String? kabupatenId) {
    if (kabupatenId == null) return [];
    final kabupaten = kabupatens.firstWhere(
      (k) => k.id == kabupatenId,
      orElse: () => Kabupaten(id: '', nama: '', kecamatans: []),
    );
    return kabupaten.kecamatans
        .map((kecamatan) => DropdownMenuItem(
              value: kecamatan.id,
              child: Text(kecamatan.nama),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _buildDesaItems(String? kecamatanId) {
    if (kecamatanId == null) return [];
    for (final kabupaten in kabupatens) {
      final kecamatan = kabupaten.kecamatans.firstWhere(
        (k) => k.id == kecamatanId,
        orElse: () => Kecamatan(id: '', nama: '', desas: []),
      );
      if (kecamatan.desas.isNotEmpty) {
        return kecamatan.desas
            .map((desa) => DropdownMenuItem(
                  value: desa.id,
                  child: Text(desa.nama),
                ))
            .toList();
      }
    }
    return [];
  }

  // Handle File Upload
  void _handleFilePicked(File file) {
    detailIndikatorController.updateFile(file);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "File ${detailIndikatorController.selectedFile.value!.path.split('/').last} berhasil dipilih."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.purple,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Tombol Kembali
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  // Header Halaman
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Indikator",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sebaran data untuk indikator tertentu.",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Form Input
                  Card(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Input Titik Koordinat
                          const CoordinatButton(btnText: "Titik Koordinat"),
                          RegionDropdownCostum(
                            value: detailIndikatorController
                                .selectedKabupaten.value,
                            items: kabupatens
                                .map((kabupaten) => DropdownMenuItem(
                                      value: kabupaten.id,
                                      child: Text(kabupaten.nama),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              detailIndikatorController.updateKabupaten(value);
                            },
                            hint: "Pilih Kabupaten",
                            label: "Kabupaten",
                          ),

// Kecamatan Dropdown
                          Obx(() => RegionDropdownCostum(
                                value: detailIndikatorController
                                    .selectedKecamatan.value,
                                items: _buildKecamatanItems(
                                    detailIndikatorController
                                        .selectedKabupaten.value),
                                onChanged: (value) {
                                  detailIndikatorController
                                      .updateKecamatan(value);
                                },
                                hint: "Pilih Kecamatan",
                                label: "Kecamatan",
                              )),

// Desa Dropdown
                          Obx(() => RegionDropdownCostum(
                                value: detailIndikatorController
                                    .selectedDesa.value,
                                items: _buildDesaItems(detailIndikatorController
                                    .selectedKecamatan.value),
                                onChanged: (value) {
                                  detailIndikatorController.updateDesa(value);
                                },
                                hint: "Pilih Desa",
                                label: "Desa",
                              )),

                          // Input Dinamis Berdasarkan Data
                          ...data.variabelId
                              .where((variabel) =>
                                  variabel.tipe == 'teks' ||
                                  variabel.tipe == 'angka')
                              .map((variabel) {
                            if (variabel.tipe == 'angka') {
                              return DetailInputBox(
                                label: variabel.nama,
                                hint: "Masukkan ${variabel.nama} (hanya angka)",
                                controller: detailIndikatorController
                                    .getController(variabel.id),
                                inputangka: true, // Khusus untuk angka
                              );
                            } else {
                              return DetailInputBox(
                                label: variabel.nama,
                                hint: "Masukkan ${variabel.nama}",
                                controller: detailIndikatorController
                                    .getController(variabel.id),
                              );
                            }
                          }).toList(),

                          CostumTimePicker(
                            label: "Waktu pelaksanaan",
                            initialTime: DateTime.now(),
                            onTimeSelected: (time) {
                              detailIndikatorController.updateTime(time);
                            },
                          ),
                          CostumDatePicker(
                            label: "Tanggal pelaksanaan",
                            initialDate: DateTime.now(),
                            onDateSelected: (DateTime? date) {
                              detailIndikatorController.updateDate(date);
                            },
                          ),
                          // Input File
                          CostumInputFile(
                            label: "Input File",
                            onFilePicked: _handleFilePicked,
                          ),
                          CostumInputGambar(label: "Gambaran Lokasi"),
                          const SizedBox(height: 30),
                          // Tombol Simpan
                          submitButton(
                              text: "Simpan Data",
                              ontap: () {
                                final detailData = {
                                  'kabupaten': detailIndikatorController
                                      .selectedKabupaten.value,
                                  'kecamatan': detailIndikatorController
                                      .selectedKecamatan.value,
                                  'desa': detailIndikatorController
                                      .selectedDesa.value,
                                  //
                                  'latitude':
                                      detailIndikatorController.latitude.value,
                                  'longitude':
                                      detailIndikatorController.longitude.value,
                                  'filePath': detailIndikatorController
                                          .selectedFile.value?.path ??
                                      '',
                                  'gambarPath': detailIndikatorController
                                          .locationImages[0].path ??
                                      '',
                                };

                                final storage = GetStorage();
                                storage.write('data_verifikasi', detailData);

                                final List<String> namaList = data.variabelId
                                    .where((variabel) =>
                                        variabel.tipe == 'teks' ||
                                        variabel.tipe == 'angka')
                                    .map((variabel) => variabel.nama)
                                    .toList();

                                // for (var nama in namaList) {
                                //   detailData[nama] = detailIndikatorController
                                //       .getController(nama as int) as String;
                                // }
                                // print('Detail Data: $detailData');
                                print('$namaList');

                                // detailData.addAll(namaList);
                              }),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
