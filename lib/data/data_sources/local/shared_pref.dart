import 'dart:convert';
import 'package:example_fish_fortune/data/models/detail_profile_response.dart';
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

  static DetailProfileResponse? get detailProfileResponse {
    try {
      return DetailProfileResponse.fromJson(
          jsonDecode(_sharedPrefs.getString(_keyDetailProfile) ?? ''));
    } catch (e) {
      return null;
    }
  }

  static set detailProfileResponse(DetailProfileResponse? value) {
    _sharedPrefs.setString(_keyDetailProfile, jsonEncode(value?.toJson()));
  }
}

const String _keyDetailProfile = "detail_profile";
