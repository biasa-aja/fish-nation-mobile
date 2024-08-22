import 'package:flutter/material.dart';

class MyFishRoadPage extends StatefulWidget {
  const MyFishRoadPage({super.key});

  @override
  State<MyFishRoadPage> createState() => _MyFishRoadPageState();
}

class _MyFishRoadPageState extends State<MyFishRoadPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("MyFishRoad"),
      ),
    );
  }
}