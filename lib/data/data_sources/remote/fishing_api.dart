import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/data/models/droprate_response.dart';

class FishingApi {
  final Dio _dio = Dio();

  Future<DroprateResponse?> getDropRate() async {
    try {
      final response = await _dio.post(
        "${Constant.BASE_URL}/fishing/v1",
        options: Options(
          headers: {
            "address": Constant.TOKEN_AUTH_DEFAULT,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DroprateResponse.fromJson(response.data["data"]);
      }
    } catch (e) {
      log("error droprate : $e");
    }
    return null;
  }
}
