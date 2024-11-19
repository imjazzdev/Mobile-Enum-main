import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_enum/data/controller/profile_controller.dart';
import 'package:mobile_enum/data/model/auth_model.dart';
import 'package:mobile_enum/data/model/dashboard_indikator_model.dart';
import 'package:mobile_enum/data/model/dashboard_model.dart';
import 'package:mobile_enum/data/model/profile_model.dart';
import 'package:mobile_enum/data/repository/api_service.dart';
import 'package:mobile_enum/data/utils/token_storage.dart';

import 'dashboard_controller.dart';
import 'dashboard_indikator_controller.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  final ProfileController profileController = Get.find<ProfileController>();
  final DashboardController dashboardController =
      Get.find<DashboardController>();
  final DashboardIndikatorController dashboardIndikatorController = Get.find();
// final MyRepository repository;
// LoginController(
// this.repository
//   );

//   final _obj = ''.obs;
//   set obj(value) => this._obj.value = value;
//   get obj => this._obj.value;

  final TextEditingController username =
      TextEditingController(text: 'enumbudikominfoprov');
  final TextEditingController password =
      TextEditingController(text: 'gsdmakro321');
  String _message = '';

  @override
  void onInit() async {
    super.onInit();
    // await fetchDashboard();
  }

  bool validateUser(AuthUser user) {
    if (user.username.isEmpty || user.password.isEmpty) {
      _message = "Username or Password cannot be empty";
      return false;
    }
    return true;
  }

  Future<void> submitLogin() async {
    final user = AuthUser(username: username.text, password: password.text);
    bool isValid = validateUser(user);
    if (isValid) {
      try {
        final loginresponse = await _apiService.authenticateUser(user);
        if (loginresponse != null && loginresponse['code'] == 200) {
          await TokenStorage.saveToken(loginresponse['data']['token']);

          print("ini tokennya ${loginresponse['data']['token']}");

          // final results = await Future.wait([
          //   _apiService.fetchProfile(),
          //   // _apiService.fetchEnumeratorDashboard(),
          //   // _apiService.fetchAnotherData(),
          // ]);

          // if (results.every((result) => result != null)) {
          //   Get.offAllNamed('/NavbarScreen');
          // } else {
          //   showMessage("Error", "Gagal memuat data. Coba lagi.");
          // }
          await profileController.loadProfile();
          await dashboardController.fetchDashboardData();
          await dashboardIndikatorController.fetchDashboardIndikatorData();

          Get.offAllNamed('/NavbarScreen');
          // Get.offAllNamed('/DetailScreen');
        } else {
          showMessage("Error", _message);
        }
      } catch (e) {
        showMessage("Error", e.toString());
      }
    } else {
      showMessage("Error", _message);
    }
  }

  // void fetchProfile() async {
  //   try {
  //     return await _apiService.fetchProfile();
  //     print("-------masuk Fetch");
  //   } on DioException catch (e) {
  //     print("Error fetching dashboard data: $e");
  //     return null;
  //   }
  // }

//   Future<List<StatusIndikatorModel>?> fetchDashboard() async {
//     try {
//       return await _apiService.fetchEnumeratorDashboard();
//       print("-------masuk Fetch");
//     } on DioException catch (e) {
//       print("Error fetching dashboard data: $e");
//       return [];
//     }
//   }
// }

/*class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  String _message = '';
  final ApiService _apiService = ApiService();
  List<StatusIndikatorModel> dashboardData = []; // Menyimpan data dashboard

  bool validateUser(AuthUser user) {
    if (user.username.isEmpty || user.password.isEmpty) {
      _message = "Username or Password cannot be empty";
      return false;
    }
    return true;
  }

  Future<void> submitLogin() async {
    final user = AuthUser(username: username.text, password: password.text);
    bool isValid = validateUser(user);
    if (isValid) {
      try {
        final loginresponse = await _apiService.authenticateUser(user);
        if (loginresponse != null && loginresponse['code'] == 200) {
          await TokenStorage.saveToken(loginresponse['data']['token']);
          print("Token saved: ${loginresponse['data']['token']}");

          await fetchDashboard();
          if (dashboardData.isNotEmpty) {
            Get.offAllNamed('/NavbarScreen');
          } else {
            showMessage("Error", "Dashboard data tidak tersedia");
          }
        } else {
          showMessage("Error", _message);
        }
      } catch (e) {
        showMessage("Error", e.toString());
      }
    } else {
      showMessage("Error", _message);
    }
  }

  Future<void> fetchDashboard() async {
    try {
      dashboardData = await _apiService.fetchEnumeratorDashboard() ?? [];
    } on DioException catch (e) {
      print("Error fetching dashboard data: $e");
      dashboardData = []; // Reset jika gagal
    }
    update(); // Update state
  }
}*/

  void showMessage(String title, String message) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text("OK"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
