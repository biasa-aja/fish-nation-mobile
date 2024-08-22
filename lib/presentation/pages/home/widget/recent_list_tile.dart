import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:example_fish_fortune/presentation/widgets/rarity_card.dart';
import 'package:flutter/material.dart';

class RecentListTile extends StatefulWidget {
  const RecentListTile({super.key});

  @override
  State<RecentListTile> createState() => _RecentListTileState();
}

class _RecentListTileState extends State<RecentListTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: MainButton(
        bgColor1: BaseColor.white,
        bgColor2: BaseColor.white,
        borderWidth: 2,
        onTap: () {},
        customText: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: "",
                    placeholder: (context, url) => SizedBox.square(
                      dimension: 48,
                      child: Image.asset(Assets.fish),
                    ),
                    errorWidget: (context, url, error) => SizedBox.square(
                      dimension: 48,
                      child: Image.asset(Assets.fish),
                    ),
                    fadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                    fit: BoxFit.cover,
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("EL MUJAER").title16().blackColor(),
                      Text(
                        "12 CM",
                        style:
                            TextStyle(color: BaseColor.black.withOpacity(0.8)),
                      ).gs14m(),
                    ],
                  ),
                  const Spacer(),
                  const RarityCard(rarity: Rarity.mytical),
                ],
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xffCCCCCC),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        onTap: () {},
                        bgColor1: BaseColor.white,
                        bgColor2: const Color(0xffEBEBE6),
                        borderWidth: 1,
                        customText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: 20,
                              child: Image.asset(Assets.coin),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "100",
                              style: TextStyle(color: Color(0xffDE813D)),
                            ).title14()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: MainButton(
                        onTap: () {},
                        bgColor1: BaseColor.white,
                        bgColor2: const Color(0xffEBEBE6),
                        borderWidth: 1,
                        customText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: 20,
                              child: Image.asset(Assets.addFish),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "ADD",
                              style: TextStyle(color: Color(0xff729CB2)),
                            ).title14()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: MainButton(
                        onTap: () {},
                        bgColor1: const Color(0xff729CB2),
                        bgColor2: const Color(0xff547484),
                        borderWidth: 1,
                        customText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox.square(
                              dimension: 20,
                              child: Image.asset(Assets.eth),
                            ),
                            const SizedBox(width: 8),
                            const Text("MINT").title14().whiteColor(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
