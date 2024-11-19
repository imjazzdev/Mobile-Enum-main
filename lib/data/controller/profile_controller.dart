import 'package:get/get.dart';

import '../model/profile_model.dart';
import '../repository/api_service.dart';

class ProfileController extends GetxController {
  final ApiService _apiService = ApiService();
  var profile = ProfileModel().obs;
  var isLoading = true.obs;

  Future<void> loadProfile() async {
    isLoading.value = true;
    try {
      ProfileModel? profileData = await _apiService.fetchProfile();

      if (profileData != null) {
        profile.value = profileData;
        print('=== DATA PROFIL ===');
        print('${profile}');
      }
    } catch (e) {
      print("Error loading profile: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
