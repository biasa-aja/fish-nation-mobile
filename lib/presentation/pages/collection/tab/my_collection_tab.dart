import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/presentation/widgets/fish_box.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';

class MyCollectionTab extends StatelessWidget {
  const MyCollectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
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
                              Expanded(
                                child: const Text("FRESHWATER FISH")
                                    .title16()
                                    .blackColor(),
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
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 76,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              return const FishBox(
                                rarity: Rarity.legend,
                                dimension: 76,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
