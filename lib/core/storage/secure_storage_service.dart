import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:practiceproject/core/contants/storage_keys.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveUserId(String userId) async {
    await _storage.write(key: StorageKeys.keyUserId, value: userId);
  }

  static Future<String?> getUserId() async {
    return await _storage.read(key: StorageKeys.keyUserId);
  }

  static Future<void> saveToken(String token) async {
    await _storage.write(key: StorageKeys.keyToken, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: StorageKeys.keyToken);
  }
}
