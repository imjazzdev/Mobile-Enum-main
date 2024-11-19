import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/dashboard_indikator_model.dart';
import '../repository/api_service.dart';

class DashboardIndikatorController extends GetxController {
  final ApiService _apiService = ApiService();
  var dashboardIndikatorList = <DashboardIndikatorModel>[].obs;
  var isLoading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // loadDashboardIndikatorFromStorage();
  }

  void loadDashboardIndikatorFromStorage() {
    // Baca data mentah dari GetStorage
    final storedData = storage.read<List<dynamic>>('dashboardData');

    if (storedData != null) {
      // Konversi data mentah ke model
      dashboardIndikatorList.value = storedData
          .map((data) => DashboardIndikatorModel.fromJson(data))
          .toList();
      print("Data berhasil dimuat dari GetStorage.");
    } else {
      // Jika tidak ada data, lakukan fetch dari API
      fetchDashboardIndikatorData();
    }
  }

  Future<void> fetchDashboardIndikatorData() async {
    isLoading.value = true;

    try {
      final List<DashboardIndikatorModel>? fetchedData =
          await _apiService.fetchDashboardList();

      if (fetchedData != null) {
        // Konversi data ke JSON sebelum disimpan ke GetStorage
        final jsonData = fetchedData.map((item) => item.toJson()).toList();
        storage.write('dashboardData', jsonData);

        // Update list indikator
        dashboardIndikatorList.value = fetchedData;

        print("Data berhasil diambil dari API dan disimpan ke GetStorage.");
      } else {
        print("Gagal mengambil data dari API.");
      }
    } catch (e) {
      print("Error saat mengambil data dari API: $e");
    }

    isLoading.value = false;
  }
}
