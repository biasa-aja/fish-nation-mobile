import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';

class FishBox extends StatelessWidget {
  final double dimension;
  final Rarity rarity;
  const FishBox({super.key, this.dimension = 66, required this.rarity});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: MainButton(
        bgColor1: bgColor,
        bgColor2: bgColor,
        borderColor: borderColor,
        borderWidth: 2,
        onTap: () {},
        customText: Center(
          child: SizedBox.square(
            dimension: dimension - 18,
            child: Image.asset(Assets.fish),
          ),
        ),
      ),
    );
  }

  Color get bgColor {
    switch (rarity) {
      case Rarity.mytical:
        return const Color(0xffF2D2DE);
      case Rarity.legend:
        return const Color(0xffFFEACB);
      case Rarity.epic:
        return const Color(0xffCBD7E4);
      case Rarity.rare:
        return const Color(0xffBFE5CF);
      case Rarity.uncommon:
        return const Color(0xffEDD5C6);
      case Rarity.common:
        return const Color(0xffEAE4E4);
    }
  }

  Color get borderColor {
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
}
