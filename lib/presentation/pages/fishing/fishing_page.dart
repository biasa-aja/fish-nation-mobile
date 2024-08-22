import 'package:camera/camera.dart';
import 'package:example_fish_fortune/app.dart';
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/core/utils/helper.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/fishing_slider.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/fishing_topbar.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/success_catch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:svg_flutter/svg.dart';

class FishingPage extends StatefulWidget {
  const FishingPage({super.key});

  @override
  State<FishingPage> createState() => _FishingPageState();
}

class _FishingPageState extends State<FishingPage> {
  late CameraController cameraController;
  FishingGuide fishingGuide = FishingGuide.guide1;
  FishingState fishingState = FishingState.strike;
  FishingCatchState? fishingCatchState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    cameraSetup();
  }

  void cameraSetup() {
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (!cameraController.value.isInitialized)
            Container()
          else
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(cameraController),
            ),
          Positioned(
            bottom: 0,
            child: _buildBottomBar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildFishRoad(),
          ),
          const Positioned(
            top: 0,
            left: 0,
            child: FishingTopbar(),
          ),
        ],
      ),
    );
  }

  Widget _buildFishRoad() {
    String asset() {
      switch (fishingState) {
        case FishingState.idle:
          return Assets.fishRoadDefault;
        default:
          return Assets.fishRoadFishing;
      }
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 712),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(asset()),
          Positioned(
            right: -150,
            top: 306,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (fishingState == FishingState.strike &&
                    fishingCatchState == null)
                  Image.asset(Assets.strike)
                else if (fishingState == FishingState.strike &&
                    fishingCatchState == FishingCatchState.yellow)
                  Image.asset(Assets.tryAgain)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    if (fishingState == FishingState.idle) {
      switch (fishingGuide) {
        case FishingGuide.guide0:
          return const SizedBox();
        case FishingGuide.guide1:
          return _buildGuide1();
        case FishingGuide.guide2:
          return _buildGuide2();
      }
    }

    if (fishingState == FishingState.strike) {
      return FishingSlider(
        onCatch: _onCatch,
      );
    }

    return const SizedBox();
  }

  Widget _buildGuide1() {
    return Container(
      width: Helper.deviceWidth(context),
      height: 180,
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
              const Text("SEARCH WATER AREA").title16().whiteColor(),
              const SizedBox(height: 8),
              Text(
                "Go to your water area nearby, & point your phone to the water area to start fishing",
                style: TextStyle(color: BaseColor.white.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ).gs14m(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuide2() {
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
              Lottie.asset(Assets.iphoneLottie),
              const SizedBox(height: 16),
              const Text(
                "SWING PHONE DOWN TO START FISHING",
                textAlign: TextAlign.center,
              ).title16().whiteColor(),
            ],
          ),
        ),
      ),
    );
  }

  void _onCatch(FishingCatchState value) async {
    final bgCamera = await cameraController.takePicture();

    setState(() {
      fishingCatchState = value;
    });

    switch (value) {
      case FishingCatchState.green:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuccessCatch(
                    bgCamera: bgCamera,
                    rarity: Rarity.epic,
                  )),
        );
        break;
      default:
    }
  }
}
