import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/data/data_sources/local/shared_pref.dart';
import 'package:example_fish_fortune/data/models/detail_profile_response.dart';

class AuthApi {
  final Dio _dio = Dio();

  Future<bool> login({
    String? username,
    String? address,
  }) async {
    try {
      final response =
          await _dio.post("${Constant.BASE_URL}/auth/v1/login", data: {
        "username": username,
        "address": address,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final detailResponse = await detailProfile(address: address);

        if (detailResponse != null) {
          SharedPref.detailProfileResponse = detailResponse;

          return true;
        }
      }
    } catch (e) {
      log("error login : $e");
    }
    return false;
  }

  Future<DetailProfileResponse?> detailProfile({String? address}) async {
    try {
      final response = await _dio.post(
        "${Constant.BASE_URL}/auth/v1/detailUser",
        options: Options(
          headers: {
            "address": address,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data["data"];

        return DetailProfileResponse.fromJson(data);
      }
    } catch (e) {
      log("error detail profile : $e");
    }
    return null;
  }
}
