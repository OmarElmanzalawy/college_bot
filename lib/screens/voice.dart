import 'dart:math';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 15));
  late final AnimationController _colorController =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  late final Animation<Color?> colorAnimation;

  bool isAnimating = false;
  String headerQuestion = 'Questions will appear here!';
  double innerCirclePadding = 0;

  late SpeechToText speech;
  bool islistening = false;
  String recognizedText = '';

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniSpeechToText();
    colorAnimation =
        ColorTween(begin: kblueHeaderColor, end: Colors.blue.shade900)
            .animate(_colorController)
          ..addListener(() {
            setState(() {});
          });
  }

  Future<void> iniSpeechToText()async{
    speech = SpeechToText();
    bool available = await speech.initialize();
    if(available){
      setState(() {
        islistening = false;
      });
    }
  }

  void _startListnening(){
    speech.listen(
      onResult: (result) {
        setState(() {
          recognizedText = result.recognizedWords;
          print('recognized: ${recognizedText}');
        });
      },
    );
  }

  void _stopListening()async{
    if(islistening){
      await speech.stop();
      setState(() {
        islistening = false;
      });
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (_controller.isAnimating) {
      isAnimating = false;
      _controller.stop();
      _colorController.reverse();
    } else {
      isAnimating = true;
      _controller.forward();
      _controller.repeat();
      _colorController.forward();
    }
  }

void resetAnimation(){
  if(_controller.isAnimating){
    _controller.reset();
    _colorController.reset();
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
                  color: colorAnimation.value,
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
                              ),
                              child: AnimatedPadding(
                                padding: EdgeInsets.all(innerCirclePadding),
                                duration: Duration(milliseconds: 700),
                                child: HoldTimeoutDetector(
                                  holdTimeout: Duration(seconds: 10),
                                  onTap: (){
                                    print('press');
                                    //_controller.stop();
                                    resetAnimation();
                                    innerCirclePadding = 0;
                                    setState(() {
                                      
                                    });
                                    },
                                  onTimeout: () {
                                    setState(() {
                                      print('timeout');
                                      startAnimation();
                                      headerQuestion =
                                          'Questions will appear here';
                                      innerCirclePadding = 0;
                                      _stopListening();
                                    });
                                  },
                                  onCancel: (){
                                      setState(() {
                                      print('Released');
                                      startAnimation();
                                      headerQuestion =
                                          'Questions will appear here';
                                      innerCirclePadding = 0;
                                      _stopListening();
                                    });
                                  },
                                  onTimerInitiated: () {
                                    setState(() {
                                      print('holding');
                                      resetAnimation();
                                      startAnimation();
                                      headerQuestion = 'Recording...';
                                      innerCirclePadding = 45;
                                      _startListnening();
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kdefaultBackgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 95,
                          child: isAnimating ? Lottie.asset('animations/waveAnimation.json',repeat: true,fit: BoxFit.cover,width: 110,height: 100) : Hero(
                            tag: 'voice',
                            child: Icon(
                              Icons.mic,
                              color: kblueHeaderColor,
                              size: 110,
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
                child: Column(
                  children: [
                    Text(recognizedText,),
                    Row(
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

  //void onHold()
}
