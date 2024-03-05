import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String kToken = "token";
const String kuser = "kuserName";
const String kblock = 'kblock';
const String kclf = "kclf";
const String kvo = 'kvo';
const String kmobile = 'kmobile';
const String kRole = "role";
const String kLanguage = "language";
const String kSignUp = "signUpStatus";
const String kUserDetail = "UserDetail";
const String kUserDetails = "UserDetails";
const String kUserAddress = "user_address";
const String kUserLat = "user_lat";
const String kUserLong = "user_long";
const String kUserId = "userId";
const String kPushToken = "pushToken";
const String kFormVersion = "KformVersion";

class SharedPref {
// To Clear All data from SharedPreferences
  static Future<bool> clearAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  // To get the authentication token
  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(kToken) is String) {
      return prefs.getString(kToken) ?? "";
    } else {
      return "";
    }
  }

  // Set token in preferences
  static Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(kToken, value);
  }

  // Save the String value for the defined key in preferences.
  static Future<bool> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  // Save the String value for the defined key in preferences.
  static Future<bool> saveInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value);
  }

  // Save the Double value for the defined key in preferences.
  static Future<bool> saveDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setDouble(key, value);
  }

  // Save the String value for the defined key in preferences.
  static Future<bool> saveBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

  static Future<double> getDoubleValueFor(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<int> getIntValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<String> getStringValueFor(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) is String) {
      return prefs.getString(key) ?? "";
    } else {
      return "";
    }
  }

  static Future<bool?> getBoolValueFor(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(key) is bool) {
      return prefs.getBool(key);
    }
    return null;
  }

  static Future<bool> removeValueOfKey(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(value);
  }

  static Future<bool> saveJsonData(
    String key,
    Map<String, dynamic> value,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, jsonEncode(value));
  }

  static Future<Map<String, dynamic>?> getJsonData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);

    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      return jsonData;
    } else {
      return null;
    }
  }
}
