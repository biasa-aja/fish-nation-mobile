import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/presentation/widgets/topbar.dart';
import 'package:flutter/material.dart';

class MyFishRoadPage extends StatefulWidget {
  const MyFishRoadPage({super.key});

  @override
  State<MyFishRoadPage> createState() => _MyFishRoadPageState();
}

class _MyFishRoadPageState extends State<MyFishRoadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Topbar(),
            const SizedBox(height: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("COMMING SOON").heading4().blackColor(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
