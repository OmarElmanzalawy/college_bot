import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('animations/animatedRobot.json')
      ),
    );
  }
}