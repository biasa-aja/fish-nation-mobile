import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_fish_fortune/data/models/droprate_response.dart';

class FishingApi {
  final Dio _dio = Dio();

  Future<DroprateResponse?> getDropRate() async {
    try {
      final response = await _dio
          .post("https://h3d56-kaaaa-aaaag-qkfqq-cai.raw.icp0.io/fishing/v1");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DroprateResponse.fromJson(response.data["data"]);
      }
    } catch (e) {
      log("error droprate : $e");
    }
    return null;
  }
}
