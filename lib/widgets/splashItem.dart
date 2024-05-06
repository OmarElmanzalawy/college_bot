import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashItem extends StatelessWidget {
  
  final VoidCallback? onpressed;
  final AssetImage image;
  final String title;
  final String subtitle;
  final String? btnText;

  final PageController controller;
  SplashItem({this.onpressed,required this.image,required this.title,required this.subtitle,this.btnText,required this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 210.0),
            child: Column(
              children: [
                Image(image: image),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SmoothPageIndicator(
                    controller: controller,
                     count: 3,
                     onDotClicked: (index) => print(index),
                     effect: ExpandingDotsEffect(
                      dotWidth: 15,
                      dotHeight: 15,
                      activeDotColor: kblueTextColor,
                     ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 145.0,bottom: 8),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32,color: kblueTextColor),
                  ),
                ),
                Text(subtitle
                ,style: ksubtitleText),
                Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: ActionButton(
                    text: btnText ?? 'Next',
                    //onpressed: () => Navigator.pushNamed(context, '/signin'),
                    onpressed: onpressed ?? (){
                    },
                    textColor: Colors.white,
                  )
                ),
              ],
            ),
          ),
        ),
      );
  }
}