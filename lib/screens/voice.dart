import 'dart:math';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 10));
  bool isAnimating = false;
  String headerQuestion = 'Questions will appear here!';
  double innerCirclePadding = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (_controller.isAnimating) {
      isAnimating = false;
      _controller.stop();
    } else {
      isAnimating = true;
      _controller.forward();
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomCurvedEdge(),
                child: Container(
                  height: 500,
                  padding: EdgeInsets.all(0),
                  color: kblueHeaderColor,
                ),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Stack(
                      children: [
                        RotationTransition(
                          turns:
                              Tween(begin: 0.0, end: 1.0).animate(_controller),
                          child: DottedBorder(
                            color: Colors.white,
                            dashPattern: [5, 12],
                            strokeWidth: 12,
                            strokeCap: StrokeCap.butt,
                            borderType: BorderType.Circle,
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: AnimatedPadding(
                                padding: EdgeInsets.all(innerCirclePadding),
                                duration: Duration(milliseconds: 700),
                                child: GestureDetector(
                                  onTapDown: (details) {
                                    //TODO: FIX MIC ICON ROTATING
                                    print('Holding');
                                    print(details.toString());

                                    setState(() {
                                      startAnimation();
                                      headerQuestion = 'Recording...';
                                      innerCirclePadding = 35;
                                    });
                                  },
                                  onTapUp: (details) {
                                    print('released');
                                    startAnimation();
                                    headerQuestion =
                                        'Questions will appear here';
                                    innerCirclePadding = 0;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kdefaultBackgroundColor,
                                    ),
                                    child: Center(
                                      child: Hero(
                                        tag: 'voice',
                                        child: Icon(
                                          Icons.mic,
                                          color: kblueTextColor,
                                          size: 110,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    headerQuestion,
                    style: TextStyle(
                      color: kdefaultBackgroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kblueHeaderColor,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            thickness: 4,
            color: Colors.grey.shade400,
            indent: 100,
            endIndent: 100,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
