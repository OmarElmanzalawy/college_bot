import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/IconButtonCard.dart';
import 'package:college_bot/widgets/customStack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
            BottomNavigationBarItem(icon: Icon(Icons.textsms), label: 'Chatbot'),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Services',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: kblueTextColor),),
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
