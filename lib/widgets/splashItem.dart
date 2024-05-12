import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SplashItem extends StatelessWidget {
  
  final VoidCallback? onpressed;
  final String animationPath;
  final String title;
  final String subtitle;
  final String? btnText;

  final PageController controller;
  SplashItem({this.onpressed,required this.animationPath,required this.title,required this.subtitle,this.btnText,required this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 350,
                  child: Lottie.asset(
                    animationPath,
                    repeat: true,
                    fit: BoxFit.fill
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: SmoothPageIndicator(
                    controller: controller,
                     count: 4,
                     onDotClicked: (index) => print(index),
                     effect: ExpandingDotsEffect(
                      dotWidth: 15,
                      dotHeight: 15,
                      activeDotColor: kblueTextColor,
                     ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0,bottom: 8),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32,color: kblueTextColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: AutoSizeText(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: ksubtitleText),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                  child: ActionButton(
                    text: btnText ?? 'Next',
                    //onpressed: () => Navigator.pushNamed(context, '/signin'),
                    onpressed: onpressed ?? (){
                    },
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}