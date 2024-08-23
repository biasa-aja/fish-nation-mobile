import 'package:example_fish_fortune/data/data_sources/local/shared_pref.dart';
import 'package:example_fish_fortune/data/models/detail_profile_response.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  DetailProfileResponse? _profile;
  DetailProfileResponse? get profile => _profile;

  void reload() {
    _profile = SharedPref.detailProfileResponse;
    notifyListeners();
  }
}
