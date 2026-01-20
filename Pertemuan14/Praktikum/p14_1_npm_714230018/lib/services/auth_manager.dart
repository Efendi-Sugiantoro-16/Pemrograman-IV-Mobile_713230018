import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static const String loginStatusKey = 'loginStatusKey';
  static const String loginTimeKey = 'loginTimeKey';
  static const String tokenKey = 'tokenKey';

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(loginStatusKey) ?? false;
    String? loginTimeString = prefs.getString(loginTimeKey);
    if (isLoggedIn && loginTimeString != null) {
      try {
        DateTime loginTime = DateTime.parse(loginTimeString);
        final Duration timeDifference =
            DateTime.now().difference(loginTime);
        // Set maximum durasi untuk validasi login di bawah ini
        const Duration maxDuration = Duration(hours: 4);
        if (timeDifference > maxDuration) {
          await logout();
          return false;
        }
        return true;
      } catch (e) {
        debugPrint('Error parsing DateTime: $e');
        await logout();
        return false;
      }
    }
    return false;
  }

  static Future<void> login(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loginStatusKey, true);
    prefs.setString(loginTimeKey, DateTime.now().toString());
    prefs.setString('username', username);
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Logging untuk debugging
    debugPrint('LOGOUT: Membersihkan semua data user...');
    
    // Hapus semua preferences terkait login
    await prefs.remove(loginStatusKey);
    await prefs.remove(loginTimeKey);
    await prefs.remove('username');
    await prefs.remove(tokenKey);
    
    // Verifikasi bahwa data telah dihapus
    bool loginStatus = prefs.getBool(loginStatusKey) ?? false;
    String? loginTime = prefs.getString(loginTimeKey);
    String? username = prefs.getString('username');
    String? token = prefs.getString(tokenKey);
    
    debugPrint('LOGOUT VERIFICATION:');
    debugPrint('  - Login Status: $loginStatus');
    debugPrint('  - Login Time: $loginTime');
    debugPrint('  - Username: $username');
    debugPrint('  - Token: ${token != null ? "exists" : "null"}');
    
    debugPrint('LOGOUT: Semua data user telah dihapus');
  }

  // Fungsi tambahan untuk clear semua preferences (opsional)
  static Future<void> clearAllPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    debugPrint('ALL PREFERENCES: Semua data telah dihapus');
  }

  // Fungsi untuk mengecek apakah semua data login sudah bersih
  static Future<bool> isDataCleaned() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loginStatus = prefs.getBool(loginStatusKey) ?? false;
    String? loginTime = prefs.getString(loginTimeKey);
    String? username = prefs.getString('username');
    String? token = prefs.getString(tokenKey);
    
    return !loginStatus && 
           loginTime == null && 
           username == null && 
           token == null;
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }
}