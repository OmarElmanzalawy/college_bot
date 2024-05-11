import 'dart:math';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(children: [
            ClipPath(
              clipper: CustomCurvedEdge(),
              child: Container(
                height: 450,
                padding: EdgeInsets.all(0),
                color: kblueHeaderColor,
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Stack(
                    children: [
                      DottedBorder(
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
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kdefaultBackgroundColor,
                              ),
                              child: Center(
                                  child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.graphic_eq,
                                  color: kblueTextColor,
                                  size: 110,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ]),
        ],
      )),
    );
  }
}
