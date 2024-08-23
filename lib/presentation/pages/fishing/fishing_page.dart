import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:example_fish_fortune/app.dart';
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/core/utils/helper.dart';
import 'package:example_fish_fortune/data/data_sources/remote/fishing_api.dart';
import 'package:example_fish_fortune/data/models/droprate_response.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/fishing_slider.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/fishing_topbar.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/widget/success_catch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FishingPage extends StatefulWidget {
  const FishingPage({super.key});

  @override
  State<FishingPage> createState() => _FishingPageState();
}

class _FishingPageState extends State<FishingPage> {
  final fishingApi = FishingApi();
  late CameraController cameraController;
  FishingGuide fishingGuide = FishingGuide.guide1;
  FishingState fishingState = FishingState.idle;
  FishingCatchState? fishingCatchState;
  Timer? timer;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;
  bool isWaterDetected = false;
  XFile? takedPicture;

  DroprateResponse? droprateResponse;

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

    loadModel();

    cameraSetup();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    cameraController.dispose();
    timer?.cancel();
    _gyroscopeSubscription?.cancel();
  }

  Future<void> loadModel() async {
    // await Tflite.loadModel(
    //   model: 'assets/water_detection_model_optimized.tflite',

    // );

    // final interpreter = await Interpreter.fromAsset(
    //   'assets/water_detection_model_optimized.tflite',
    // );
  }

  void listenToGyroscope() {
    _gyroscopeSubscription =
        gyroscopeEventStream().listen((GyroscopeEvent event) async {
      if (event.x < -1.5 && fishingState == FishingState.idle) {
        // Adjust the threshold value based on your needs
        await AudioPlayer().play(AssetSource(Assets.throwFishRodSound));
        setState(() {
          fishingState = FishingState.fishing;
        });
        _gyroscopeSubscription?.pause();

        _delayForStrike();
      }
    });
  }

  Future<void> processImage(CameraImage image) async {
    final plane = image.planes[0];
    final bytes = plane.bytes;
    final imageSize = Size(image.width.toDouble(), image.height.toDouble());
    // log('planes : ${image.planes.first.bytes}');

    // var recognitions = await Tflite.runModelOnFrame(
    //     bytesList: image.planes.map((plane) {
    //       return plane.bytes;
    //     }).toList(), // required
    //     imageHeight: image.height,
    //     imageWidth: image.width,
    //     imageMean: 127.5, // defaults to 127.5
    //     imageStd: 127.5, // defaults to 127.5
    //     rotation: 90, // defaults to 90, Android only
    //     numResults: 2, // defaults to 5
    //     threshold: 0.1, // defaults to 0.1
    //     asynch: true // defaults to true
    //     );

    // log("recognitions : $recognitions");
  }

  void waterDetection(XFile file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    final result = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 100),
        receiveTimeout: const Duration(seconds: 100),
        sendTimeout: const Duration(seconds: 100),
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    ).post(
      "https://984b-2a09-bac5-d561-18be-00-277-b9.ngrok-free.app/predict",
      data: formData,
    );

    final isWaterDetected = result.data["water_detected"];

    setState(() {
      this.isWaterDetected = isWaterDetected;
    });

    if (isWaterDetected && fishingState != FishingState.idle) {
      return;
    }

    if (isWaterDetected) {
      setState(() {
        fishingGuide = FishingGuide.guide2;
        fishingState = FishingState.idle;
      });

      if (_gyroscopeSubscription != null) {
        _gyroscopeSubscription?.resume();
      } else {
        listenToGyroscope();
      }
      return;
    }

    setState(() {
      fishingGuide = FishingGuide.guide1;
      fishingState = FishingState.idle;
    });
  }

  void cameraSetup() async {
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});

      // cameraController.startImageStream((CameraImage image) {
      //   if (!cameraController.value.isStreamingImages) {
      //     return;
      //   }
      //   processImage(image);
      //   log("is called");
      // });
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

    _takePicture();
  }

  void _takePicture() {
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        final image =
            await Helper.compressImage(await cameraController.takePicture());

        takedPicture = image;

        waterDetection(image ?? XFile(""));
      },
    );
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
                else if (fishingState == FishingState.fishing &&
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

  void _delayForStrike() async {
    final response = await fishingApi.getDropRate();

    if (response != null) {
      droprateResponse = response;
    }

    await Future.delayed(
        Duration(seconds: math.Random.secure().nextInt(1) + 5));

    setState(() {
      fishingState = FishingState.strike;
    });

    final strike2Sound = AudioPlayer();

    await AudioPlayer().play(AssetSource(Assets.strikeSound));
    await strike2Sound.play(AssetSource(Assets.strike2Sound));

    await Future.delayed(const Duration(seconds: 4));

    strike2Sound.stop();
  }

  void _onCatch(FishingCatchState value) async {
    setState(() {
      fishingCatchState = value;
    });

    switch (value) {
      case FishingCatchState.green:
        await AudioPlayer().play(AssetSource(Assets.catchFishSound));
        await AudioPlayer().play(AssetSource(Assets.catchFish2Sound));
        // timer?.cancel();

        log("droprateResponse : ${droprateResponse}");

        final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuccessCatch(
                    bgCamera: takedPicture,
                    droprateResponse: droprateResponse,
                  )),
        );

        if (result == null) {
          // _takePicture();
          setState(() {
            fishingState = FishingState.idle;
            fishingCatchState = null;
            // fishingGuide = FishingGuide.guide2;
          });
        }
        break;
      case FishingCatchState.yellow:
        setState(() {
          fishingState = FishingState.fishing;
        });

        _delayForStrike();
      case FishingCatchState.red:
        setState(() {
          fishingState = FishingState.idle;
          fishingGuide =
              isWaterDetected ? FishingGuide.guide2 : FishingGuide.guide1;
        });
    }
  }
}
