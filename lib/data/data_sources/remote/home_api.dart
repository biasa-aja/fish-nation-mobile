import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/data/data_sources/local/shared_pref.dart';
import 'package:example_fish_fortune/data/models/recent_item_response.dart';

class HomeApi {
  final Dio _dio = Dio();

  Future<List<RecentItemResponse>> getRecentList() async {
    try {
      final response = await _dio.get(
        "${Constant.BASE_URL}/recent/v1",
        options: Options(
          headers: {
            "address": SharedPref.detailProfileResponse?.address,
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
