import 'package:example_fish_fortune/core/extensions/all_extensions.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';

class RarityCard extends StatelessWidget {
  final Rarity rarity;
  const RarityCard({super.key, required this.rarity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 110,
      child: MainButton(
        bgColor1: bgColor1,
        bgColor2: bgColor2,
        borderWidth: 1,
        onTap: () {},
        customText: Text(rarity.title).cd14b().whiteColor(),
      ),
    );
  }

  Color get bgColor1 {
    switch (rarity) {
      case Rarity.mytical:
        return const Color(0xffFF4085);
      case Rarity.legend:
        return const Color(0xffF6BA61);
      case Rarity.epic:
        return const Color(0xff598EDC);
      case Rarity.rare:
        return const Color(0xff24AF64);
      case Rarity.uncommon:
        return const Color(0xffA35122);
      case Rarity.common:
        return const Color(0xffB0B0B0);
    }
  }

  Color get bgColor2 {
    switch (rarity) {
      case Rarity.mytical:
        return const Color(0xffD3356E);
      case Rarity.legend:
        return const Color(0xffD8A14F);
      case Rarity.epic:
        return const Color(0xff4679C4);
      case Rarity.rare:
        return const Color(0xff1A824A);
      case Rarity.uncommon:
        return const Color(0xff7E3B15);
      case Rarity.common:
        return const Color(0xff808080);
    }
  }
}
