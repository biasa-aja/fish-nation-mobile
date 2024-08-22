import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ChallengeListTile extends StatefulWidget {
  const ChallengeListTile({super.key});

  @override
  State<ChallengeListTile> createState() => _ChallengeListTileState();
}

class _ChallengeListTileState extends State<ChallengeListTile> {
  bool get is100AndUnclaim => false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134,
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: const Text(
                          "CATCH 5 RARE FISH",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ).title14().blackColor(),
                      ),
                      const Text("50%").gs14m().blackColor(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const LinearProgressIndicator(
                    backgroundColor: Color(0xffCCCCCC),
                    color: Color(0xff249063),
                    value: 1 / 2,
                    minHeight: 4,
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xffCCCCCC),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 20,
                    child: Image.asset(Assets.coin),
                  ),
                  const SizedBox(width: 8),
                  const Text("50").title16(),
                  const SizedBox(width: 24),
                  SizedBox.square(
                    dimension: 25,
                    child: Image.asset(Assets.xp),
                  ),
                  const SizedBox(width: 8),
                  const Text("15").title16(),
                  const Spacer(),
                  if (is100AndUnclaim)
                    const Text(
                      "CLAIM REWARD",
                      style: TextStyle(color: Color(0xff249063)),
                    ).title14()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
