import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiKey => dotenv.env['BASE_URL'] ?? '';
  static String get apiKeyBaseUrlV2 => dotenv.env['BASE_URL_V2'] ?? '';
  
  static void validate() {
    if (apiKey.isEmpty && apiKeyBaseUrlV2.isEmpty) {
      throw Exception('API_KEY is not configured in .env file');
    }
  }
}