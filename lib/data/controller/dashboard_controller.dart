import 'package:get/get.dart';

import '../model/dashboard_model.dart';
import '../repository/api_service.dart';

class DashboardController extends GetxController {
  final ApiService _apiService = ApiService();
  var statusList = <StatusIndikatorModel>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;

  Future<void> fetchDashboardData() async {
    try {
      isLoading(true);
      var data = await _apiService.fetchEnumeratorDashboard();
      if (data != null) {
        statusList.assignAll(data);
      } else {
        isError(true);
      }
    } catch (e) {
      isError(true);
      print('Error fetching dashboard data: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
