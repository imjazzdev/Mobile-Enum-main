import 'package:get_storage/get_storage.dart';

class TokenStorage{
  static final _storage = GetStorage();
  static const _tokenKey = 'token_key';

  static Future<void> saveToken(String token ) async {
    await _storage.write(_tokenKey, token);
  }
  static String? getToken(){
    return _storage.read(_tokenKey);
  }

  static Future<void> deleteToken() async {
    await _storage.remove(_tokenKey);
  }
  }