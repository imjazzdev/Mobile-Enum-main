import 'package:dio/dio.dart';
import 'package:mobile_enum/data/utils/base_url.dart';
import 'package:mobile_enum/data/utils/token_storage.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.baseUrl = BaseUrl.UrlApi ?? '';
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      print("--ERROR FETCHING DASHBOARD DATA : $e");
      rethrow;
    }
  }

  Future<Response> get(String path) async {
    try {
      String? token = TokenStorage.getToken();
      _dio.options.headers = {'Authorization': 'Bearer $token'};

      final response = await _dio.get(path);
      return response;
    } on DioException catch (e) {
      print("Ini masih api client $e");
      rethrow;
    }
  }
}
