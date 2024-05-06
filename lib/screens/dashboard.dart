import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/IconButtonCard.dart';
import 'package:college_bot/widgets/customStack.dart';
import 'package:college_bot/widgets/titledcardbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      bottomNavigationBar: /*AnimatedBottomNavigationBar(
        
        icons: [Icons.home,
        Icons.account_circle,],
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        //backgroundColor: Colors.blue,
        elevation: 0,
        inactiveColor: Colors.black,
        activeColor: Color(0xff0e61db),
        iconSize: 35,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapWidth: 20,
        blurEffect: true,
        borderColor: Colors.grey.withOpacity(0.2),
        backgroundGradient: kbuttonGradient,
        gapLocation: GapLocation.center,
        activeIndex: navigationIndex,
        onTap: (value) {
            navigationIndex = value;
            setState(() {
              
            });
        }
      ),*/
      
      BottomNavigationBar(
        
          selectedIconTheme: IconThemeData(
            size: 40
          ),
          unselectedIconTheme: IconThemeData(
            size: 25),
          currentIndex: navigationIndex,
          onTap: (value) {
            navigationIndex = value;
            setState(() {
              
            });
          },
          selectedItemColor: Colors.blue,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile')
          ]),



      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //forceMaterialTransparency: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 14),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Welcome, Omar!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: kblueTextColor),
                ),
              ),
            ),
            Container(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustomStack(
                      question:
                          'What is the difference between Software Engineering and Information Systems?'),
                  CustomStack(
                      question:
                          'What is the northhampton dual degree program?'),
                  CustomStack(
                      question: 'What is GPA and how is it calculated?'),
                ],
              ),
            ),
           Row(
             children: [
               TitledCardButton(title: 'Chat with \nCollegeBot', icon: Icons.chat_bubble),
               Padding(
                 padding: const EdgeInsets.only(left: 35.0),
                 child: TitledCardButton(title: 'Talk with \nCollegeBot', icon: Icons.mic),
               ),
             ],
           ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8.0,top: 12),
              child: Text('Other Services',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: kblueTextColor),),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButtonCard(text: 'Reset Password', icon: Icons.key),
                  IconButtonCard(text: 'Course Registration', icon: Icons.event_note),
                  IconButtonCard(text: 'Academic Advisor', icon: Icons.school),
                  IconButtonCard(text: 'Chatbot', icon: Icons.smart_toy),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
