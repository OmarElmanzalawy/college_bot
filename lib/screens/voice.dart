import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:lottie/lottie.dart';
import '../generative_model_view_model.dart';

extension StringExtensions on String { 
  String capitalize() { 
    return "${this[0].toUpperCase()}${this.substring(1)}"; 
  } 
}

class VoiceAssistantView extends ConsumerStatefulWidget {
  @override
  _VoiceAssistantViewState createState() => _VoiceAssistantViewState();
}

class _VoiceAssistantViewState extends ConsumerState<VoiceAssistantView>
    with TickerProviderStateMixin {
  late SpeechToText _speechToText;
  bool isListening = false;
  String recognizedText = "";
  final TextEditingController _aiResponseController = TextEditingController();


  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 15));
  late final AnimationController _colorController =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  late final Animation<Color?> colorAnimation;

  bool isAnimating = false;
  String headerQuestion = 'Questions will appear here!';
  double innerCirclePadding = 0;


  @override
  void initState() {
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
    _speechToText = SpeechToText();
    bool available = await _speechToText.initialize();
    if(available){
      setState(() {
        isListening = false;
      });
    }
  }

  void _startListnening(){
    _speechToText.listen(
      onResult: (result) {
        setState(() {
          recognizedText = result.recognizedWords;
          _aiResponseController.text = recognizedText;
          print('recognized: ${recognizedText}');
        });
      },
    );
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _getAiResponse(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _aiResponseController.text = "Fetching AI response...";
    });

    try {
      final response = await ref.read(chatProvider.notifier).sendMessage(query);
      setState(() {
        print('response: $response');
        _aiResponseController.text = response;
      });
    } catch (e) {
      setState(() {
        _aiResponseController.text = "Error: $e";
      });
    }
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

  void resetAnimation() {
    if (_controller.isAnimating) {
      _controller.reset();
      _colorController.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose();
    _aiResponseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper:
                      CustomCurvedEdge(), // Assuming you have a custom clipper
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
                                  onTap: () {
                                    print('press');
                                    resetAnimation();
                                    innerCirclePadding = 0;
                                    headerQuestion =
                                        'Questions will appear here';
                                    setState(() {});
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
                                  onCancel: () {
                                    setState(() {
                                      print('Released');
                                      startAnimation();
                                      headerQuestion = 'Questions will appear here';
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
                          child: isAnimating
                              ? Lottie.asset(
                                  'animations/waveAnimation.json',
                                  repeat: true,
                                  fit: BoxFit.cover,
                                  width: 110,
                                  height: 100,
                                )
                              : Hero(
                                  tag: 'voice',
                                  child: Icon(
                                    Icons.mic,
                                    color: kblueHeaderColor,
                                    size: 110,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 400.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        headerQuestion,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        key: ValueKey<String>(headerQuestion),
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
                child: AnimatedContainer(
                  duration: Duration(seconds: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _aiResponseController,
                    cursorColor: Colors.transparent,
                    maxLines: null,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 77, 203),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: InputBorder.none,
                      labelText: 'Response',
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  //headerQuestion = _aiResponseController.text.isNotEmpty ? _aiResponseController.text : headerQuestion;
                  _getAiResponse(recognizedText);
                  print('paramater: $recognizedText');
                  headerQuestion = recognizedText.split(' ').map((word) => word.capitalize()).join(' '); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kblueHeaderColor,
                ),
                child: Text(
                  'Get  Response',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

