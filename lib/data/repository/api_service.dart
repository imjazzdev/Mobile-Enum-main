import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_enum/data/model/auth_model.dart';
import 'package:mobile_enum/data/model/dashboard_indikator_model.dart';
import 'package:mobile_enum/data/model/dashboard_model.dart';
import 'package:mobile_enum/data/repository/api_client.dart';
import 'package:mobile_enum/data/utils/token_storage.dart';

import '../model/profile_model.dart';

class ApiService extends GetxService {
  // Future<ApiService> init() async {
  //   return this;
  // }
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>?> authenticateUser(AuthUser user) async {
    try {
      final response =
          await _apiClient.post('/auth/login-enumerator', user.toJson());
      if (response.statusCode == 200) {
        return response.data;
        // print(response.data);
      } else {
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 401) {
          throw "Username atau Password salah";
        }
      }
      throw "Terjadi kesalahan, coba lagi nanti";
    }
  }

  Future<ProfileModel> fetchProfile() async {
    var profileData;
    final response = await _apiClient.get('/mobile/profile');

    if (response.statusCode == 200) {
      profileData = ProfileModel.fromJson(response.data['data']);
    }
    return profileData;
  }

  Future<List<StatusIndikatorModel>?> fetchEnumeratorDashboard() async {
    final response = await _apiClient.get('/mobile/dashboard/enumerator');

    if (response.statusCode == 200) {
      var data = response.data['data'];
      print('=== DATA DASHBOARD ====');
      print('${response.data['data']}');
      return [
        StatusIndikatorModel(status: "Terinput", value: data['terinput']),
        StatusIndikatorModel(
            status: "Diverifikasi", value: data['diverifikasi']),
        StatusIndikatorModel(status: "Ditolak", value: data['ditolak']),
        StatusIndikatorModel(status: "Menunggu", value: data['menunggu'])
      ];
    }
    return [];
  }

  Future<List<DashboardIndikatorModel>?> fetchDashboardList() async {
    try {
      final response =
          await _apiClient.get('/mobile/dashboard/enumerator/indikator');

      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        List<DashboardIndikatorModel> dashboardIndikatorData =
            data.map((item) => DashboardIndikatorModel.fromJson(item)).toList();
        return dashboardIndikatorData;
      } else {
        print("Failed to fetch data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
