import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> storeToken(String token, String logstatus) async {
    await _secureStorage.write(key: 'auth_token', value: token);
    await _secureStorage.write(key: 'loggedState', value: logstatus);
  }

  Future<String?> retrieveToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<String?> retrieveLoginStatus() async {
    return await _secureStorage.read(key: 'loggedState');
  }

  Future<bool> deleteTokenState() async {
    try {
      await _secureStorage.delete(key: 'auth_token');
      await _secureStorage.delete(key: 'loggedState');
      return true;
    } catch (e) {
      return false;
    }
  }
}
