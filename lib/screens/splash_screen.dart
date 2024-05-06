import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:college_bot/widgets/splashItem.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  int pageCounter = 0;
  static String id = 'splash_screen';
  final PageController _pageController = PageController(initialPage: 0);

  void incrementPage() {
    pageCounter += 1;
    _pageController.animateToPage(pageCounter,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(controller: _pageController, children: [  
        //PAGE 1
        SplashItem(
          controller: _pageController,
          image: AssetImage('images/chatbot.png'),
          title: 'CollegeBotChat',
          subtitle: 'Interactive chatbot for students',
          onpressed: () {
            incrementPage();
          },
        ),
        SplashItem(
          controller: _pageController,
          image: AssetImage('images/chatbot.png'),
          title: 'CollegeBotChat',
          subtitle: 'Interactive chatbot for students',
          onpressed: () => incrementPage(),
        ),
        SplashItem(
          controller: _pageController,
          image: AssetImage('images/chatbot.png'),
          title: 'CollegeBotChat',
          subtitle: 'Interactive chatbot for students',
          btnText: 'Login',
          onpressed: () => Navigator.pushNamed(context, '/signin'),
        ),
      ],
      onPageChanged: (value) {
        pageCounter = value;
        print(value);
      },
      ),
    );
  }
}
