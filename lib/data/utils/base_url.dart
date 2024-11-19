import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseUrl{
  // ignore: non_constant_identifier_names
  static String? get UrlApi{
    return dotenv.env['API_URL'];
  }
}