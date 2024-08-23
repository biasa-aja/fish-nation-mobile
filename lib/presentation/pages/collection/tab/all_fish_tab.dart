import 'package:example_fish_fortune/core/extensions/all_extensions.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/data/models/recent_item_response.dart';
import 'package:example_fish_fortune/presentation/pages/home/widget/recent_list_tile.dart';
import 'package:flutter/material.dart';

class AllFishTab extends StatelessWidget {
  const AllFishTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 16 : 0, bottom: 16),
            child: RecentListTile(
              model: RecentItemResponse(
                title: "Java Barb",
                height: 14,
                price: 15,
                rarity: Rarity.common.title,
              ),
            ),
          );
        },
      ),
    );
  }
}
