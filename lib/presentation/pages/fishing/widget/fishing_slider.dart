import 'dart:developer';

import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

class FishingSlider extends StatefulWidget {
  final void Function(FishingCatchState) onCatch;
  const FishingSlider({super.key, required this.onCatch});

  @override
  _FishingSliderState createState() => _FishingSliderState();
}

class _FishingSliderState extends State<FishingSlider> {
  final modalKey = GlobalKey<State>();
  double stopperPosition = 0.1; // Initial position (center)
  bool isMovingRight = true;
  Timer? timer;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    startMoving();
    listenToGyroscope();
  }

  void startMoving() {
    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        if (isMovingRight) {
          stopperPosition += 0.01;
          if (stopperPosition >= 1.0) {
            isMovingRight = false;
          }
        } else {
          stopperPosition -= 0.01;
          if (stopperPosition <= 0.0) {
            isMovingRight = true;
          }
        }
      });
    });
  }

  void stopMovement() {
    timer?.cancel();
    _gyroscopeSubscription?.cancel();
    // Check if the stopper is within the green area

    /// 0.45 - 0.56 = green
    /// 0.30 - 0.44 || 0.57 - 0.72 = yellow
    /// else = red
    if (stopperPosition >= 0.45 && stopperPosition <= 0.56) {
      widget.onCatch(FishingCatchState.green);
      return;
    }

    if (stopperPosition >= 0.30 && stopperPosition <= 0.44 ||
        stopperPosition >= 0.57 && stopperPosition <= 0.72) {
      widget.onCatch(FishingCatchState.yellow);
      return;
    }

    widget.onCatch(FishingCatchState.red);
  }

  void listenToGyroscope() {
    _gyroscopeSubscription =
        gyroscopeEventStream().listen((GyroscopeEvent event) {
      if (event.x > 1.5) {
        // Adjust the threshold value based on your needs
        stopMovement();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.deviceWidth(context),
      height: 260,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            BaseColor.black.withOpacity(0.0),
            BaseColor.black.withOpacity(0.6),
          ],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 230,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Image.asset(Assets.fishingSlider),
                        ),
                        Positioned(
                          left: (200 * stopperPosition) -
                              10, // Adjusting the position
                          bottom: -4,
                          child: Image.asset(
                            Assets.fishingPointer,
                            width: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "SWING PHONE DOWN TO STAT FISHING",
                textAlign: TextAlign.center,
              ).title16().whiteColor(),
            ],
          ),
        ),
      ),
    );
  }
}
