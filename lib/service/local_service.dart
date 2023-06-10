import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();

  static Future setToken(String token) async => await storage.write(key: "token", value: token);

  static Future<String?> getToken() async => await storage.read(key: "token");

  static Future deleteToken() async => await storage.delete(key: "token");
}