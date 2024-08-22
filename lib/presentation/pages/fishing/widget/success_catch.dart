import 'dart:io';

import 'package:camera/camera.dart';
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/core/utils/helper.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/fishing_topbar.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:example_fish_fortune/presentation/widgets/rarity_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessCatch extends StatefulWidget {
  final XFile? bgCamera;
  final Rarity rarity;
  const SuccessCatch({super.key, required this.bgCamera, required this.rarity});

  @override
  State<SuccessCatch> createState() => _SuccessCatchState();
}

class _SuccessCatchState extends State<SuccessCatch> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
                height: Helper.deviceHeight(context),
                child: Image.file(
                  File(widget.bgCamera?.path ?? ""),
                  fit: BoxFit.cover,
                )),
            Container(
              height: Helper.deviceHeight(context),
              color: BaseColor.black.withOpacity(0.3),
            ),
            Positioned(
              left: -(Helper.deviceWidth(context) / 2),
              top: -110,
              child: Lottie.asset(
                Assets.epicEffect,
                fit: BoxFit.cover,
                height: Helper.deviceHeight(context),
                width: Helper.deviceWidth(context),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Stack(
                children: [
                  const FishingTopbar(),
                  SizedBox(
                    width: Helper.deviceWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 110),
                          const Text(
                            "YOU'VE JUST \nEARNED A NEW FISH",
                            textAlign: TextAlign.center,
                          ).heading4().whiteColor(),
                          const SizedBox(height: 24),
                          Image.asset(
                            Assets.fishCatched,
                            width: 200,
                          ),
                          const Text("TUNA BLUE").cd20b().whiteColor(),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 28,
                                width: 110,
                                child: MainButton(
                                  onTap: () {},
                                  bgColor1: Colors.transparent,
                                  bgColor2: Colors.transparent,
                                  borderColor: BaseColor.white,
                                  borderWidth: 1,
                                  customText: const Text("58 CM")
                                      .title14()
                                      .whiteColor(),
                                ),
                              ),
                              const SizedBox(width: 8),
                              RarityCard(
                                rarity: widget.rarity,
                                borderColor: BaseColor.white,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: MainButton(
                              onTap: () {},
                              bgColor1: const Color(0xff729CB2),
                              bgColor2: const Color(0xff547484),
                              borderWidth: 4,
                              customText: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    child: Image.asset(Assets.eth),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("MINT").title16().whiteColor(),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: MainButton(
                              onTap: () {},
                              bgColor1: const Color(0xffEBEBE6),
                              bgColor2: const Color(0xffB2B2B2),
                              borderWidth: 4,
                              customText: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    child: Image.asset(Assets.addFish),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "ADD TO COLLECTION",
                                    style: TextStyle(color: BaseColor.primary),
                                  ).title16(),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: MainButton(
                              onTap: () {},
                              bgColor1: const Color(0xffEBEBE6),
                              bgColor2: const Color(0xffB2B2B2),
                              borderWidth: 4,
                              customText: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Image.asset(Assets.coin),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "SELL FOR 40",
                                    style: TextStyle(color: Color(0xffDE813D)),
                                  ).title16(),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: _onContinue,
                            child: const Text("CONTINUE FISHING")
                                .title16()
                                .whiteColor(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue() {
    Navigator.of(context).pop();
  }
}
