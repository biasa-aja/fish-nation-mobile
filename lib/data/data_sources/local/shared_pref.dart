import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _sharedPrefs;

  factory SharedPref() => _instance;

  static final SharedPref _instance = SharedPref._internal();

  SharedPref._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  void clear() {
    _sharedPrefs.clear();
  }

  Future<void> reload() async {
    await _sharedPrefs.reload();
  }
}

const String _keySignIn = "sign_in";
