import 'package:college_bot/constants.dart';
import 'package:college_bot/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/splashItem.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  static String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageCounter = 0;

  final PageController _pageController = PageController(initialPage: 0);

  void incrementPage() {
    pageCounter += 1;
    _pageController.animateToPage(pageCounter,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          //PAGE 1
          SplashItem(
            controller: _pageController,
            //image: AssetImage('images/chatbot.png'),
            animationPath: 'animations/animatedRobot.json',
            title: 'Welcome to CollegeBot',
            subtitle: 'Your AI-Powered Personal Assistant for AAST\n',
            onpressed: () {
              incrementPage();
            },
          ),
          SplashItem(
            controller: _pageController,
            //image: AssetImage('images/chatbot.png'),
            animationPath: 'animations/chatbubble.json',
            title: 'Ask Anything',
            subtitle: 'Get Instant Answers Anyime, Anywhere!\n',
            onpressed: () => incrementPage(),
          ),
          SplashItem(
            controller: _pageController,
            //image: AssetImage('images/chatbot.png'),
            animationPath: 'animations/headsetGirl.json',
            title: 'Your Choice, Voice or Text',
            subtitle:
                'Interact with CollegeBot Using Text or Voice \n Get Answers the Way You Prefer!',
            btnText: 'Next',
            onpressed: () => incrementPage(),
          ),
          SplashItem(
              controller: _pageController,
              animationPath: 'animations/laptop.json',
              title: 'University Insights',
              subtitle:
                  'Ask University-Specific Questions \n Get Precise Answers Tailored for Your Academic Journey!',
              btnText: 'Login',
              onpressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SignInScreen(),
                    type: PageTransitionType.topToBottom,
                    duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                  ),
                );
              }),
        ],
        onPageChanged: (value) {
          pageCounter = value;
          print(value);
        },
      ),
    );
  }
}
