import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/data/models/recent_item_response.dart';

class HomeApi {
  final Dio _dio = Dio();

  Future<List<RecentItemResponse>> getRecentList() async {
    try {
      final response = await _dio.post(
        "https://h3d56-kaaaa-aaaag-qkfqq-cai.raw.icp0.io/collection/v1/recent",
        options: Options(
          headers: {
            "address": Constant.TOKEN_AUTH_DEFAULT,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data["data"] as List?;

        return data?.map((e) => RecentItemResponse.fromJson(e)).toList() ?? [];
      }
    } catch (e) {
      log("error recent : $e");
    }
    return [];
  }
}
