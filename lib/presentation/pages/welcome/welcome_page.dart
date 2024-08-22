import 'package:example_fish_fortune/config/routes/route_path.dart';
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4F7F98),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AspectRatio(
                aspectRatio: 313 / 400,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.bgWelcome),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.launcher, height: 60),
                      const SizedBox(height: 24),
                      const Text(Constant.APP_NAME).heading4().whiteColor(),
                      const SizedBox(height: 16),
                      Text(
                        "Discover rare fish and turn them into\nvaluable collections!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: BaseColor.white.withOpacity(0.7),
                        ),
                      ).gs14m(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: MainButton(
                    textButton: "GET STARTED",
                    onTap: _onGotoRegister,
                    bgColor1: BaseColor.white,
                    bgColor2: const Color(0xffDCDCDC),
                    textColor: BaseColor.black,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: _onGotoLogin,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: const Text("SIGN IN").title16().whiteColor(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onGotoRegister() {
    context.push(RoutePath.register);
  }

  void _onGotoLogin() {
    context.push(RoutePath.login);
  }
}
