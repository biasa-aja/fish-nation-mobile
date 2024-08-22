import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/presentation/widgets/avatar.dart';
import 'package:flutter/material.dart';

class Topbar extends StatefulWidget {
  const Topbar({super.key});

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Avatar(url: ""),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Dappa").cd16b().blackColor(),
                    const Text("LVL 6").gs14m().greyColor(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 28,
            child: Image.asset(Assets.coin),
          ),
          const SizedBox(width: 8),
          const Text("500").title18(),
          const SizedBox(width: 24),
          SizedBox(
            height: 28,
            child: Image.asset(Assets.energy),
          ),
          const SizedBox(width: 8),
          const Text("5").title18(),
        ],
      ),
    );
  }
}
