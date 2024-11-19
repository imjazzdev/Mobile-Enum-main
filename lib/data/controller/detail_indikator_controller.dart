import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_enum/data/model/indikator_model.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailIndikatorController extends GetxController {
  // Coordinates
  var latitude = ''.obs;
  var longitude = ''.obs;

  // Dropdown values
  var selectedKabupaten = ''.obs;
  var selectedKecamatan = ''.obs;
  var selectedDesa = ''.obs;
  var selectedDate = Rxn<DateTime>();
  var selectedTime = Rxn<DateTime>();
  var selectedFile = Rxn<File>();

  // Metode untuk mengupdate variabel
  void updateKabupaten(String? value) {
    selectedKabupaten.value = value!;
    selectedKecamatan.value;
    selectedDesa.value;
  }

  void updateKecamatan(String? value) {
    selectedKecamatan.value = value!;
    selectedDesa.value;
  }

  void updateDesa(String? value) {
    selectedDesa.value = value!;
  }

  void updateDate(DateTime? date) {
    selectedDate.value = date;
  }

  void updateTime(DateTime? time) {
    selectedTime.value = time;
  }

  void updateFile(File file) {
    selectedFile.value = file;
  }

  final Map<int, TextEditingController> _controllers = {};

  TextEditingController getController(int id) {
    // Jika controller untuk ID ini belum ada, buat baru dan tambahkan ke map
    if (!_controllers.containsKey(id)) {
      _controllers[id] = TextEditingController();
    }
    // Kembalikan controller yang sudah ada atau yang baru dibuat
    return _controllers[id]!;
  }

  // File Upload
  var uploadedFile = Rx<File?>(null);

  // Image Gallery
  var locationImages = <File>[].obs;

  // Image Picker instance
  final ImagePicker _picker = ImagePicker();

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Memastikan service lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Layanan lokasi tidak aktif.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Izin lokasi ditolak secara permanen.');
    }

    // Mendapatkan posisi saat ini
    Position position = await Geolocator.getCurrentPosition();
    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();
  }

  Future<void> requestPermissions() async {
    if (await Permission.camera.isDenied) {
      await Permission.camera.request();
    }
    if (await Permission.photos.isDenied) {
      await Permission.photos.request();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    if (locationImages.length >= 1) {
      // Batas maksimal 3 gambar
      return;
    }

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      locationImages.add(File(pickedFile.path));
    }
  }

  void showImageSourceSnackbar() {
    if (locationImages.length >= 1) {
      Get.defaultDialog(
        title: "Batas Maksimal",
        middleText: "Maksimal gambar yang diambil hanya 1.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    } else {
      Get.defaultDialog(
        title: "Pilih Sumber Gambar",
        middleText: "Ambil gambar dari kamera atau galeri",
        actions: [
          TextButton.icon(
            icon: Icon(Icons.camera, color: Colors.blue),
            label: Text("Kamera", style: TextStyle(color: Colors.blue)),
            onPressed: () async {
              await requestPermissions();
              pickImage(ImageSource.camera);
              Get.back();
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.photo, color: Colors.green),
            label: Text("Galeri", style: TextStyle(color: Colors.green)),
            onPressed: () async {
              await requestPermissions();
              pickImage(ImageSource.gallery);
              Get.back();
            },
          ),
        ],
      );
    }
  }

  void removeImage(int index) {
    locationImages.removeAt(index);
  }

  void submitData() {
    // addDatatoStorage();
    // Pindah ke halaman verifikasi
    // Get.to(const VerifikasiScreen());

    // print("Uploaded File: ${uploadedFile.value?.path}");
    // print(
    //     "Location Images: ${locationImages.map((image) => image.path).toList()}");

    // Implement API call or data processing here
  }

  // void addDatatoStorage() {
  //   final detailData = {
  //     'kabupaten': selectedKabupaten.value,
  //     'kecamatan': selectedKecamatan.value,
  //     'desa': selectedDesa.value,
  //     'titikKoordinat' : ,
  //     // 'namaSekolah': detailIndikatorController.namaSekolahController.text,
  //     // 'jamOperasional': detailIndikatorController.jamOperasional.value,
  //     // 'jamSelesai': detailIndikatorController.jamSelesai.value,
  //     'filePath': selectedFile.value?.path ?? '',
  //     'gambarPath': locationImages[0].path,
  //   };

  //   final storage = GetStorage();

  //   // Ambil data lama dari GetStorage
  //   List<dynamic> existingData = storage.read('indikatorList') ?? [];

  //   // Tambahkan data baru ke list
  //   existingData.add(detailData);

  //   // Simpan kembali list ke GetStorage
  //   storage.write('indikatorList', existingData);
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
