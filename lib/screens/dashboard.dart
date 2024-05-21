import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/curves/diagonalPathClipper1.dart';
import 'package:college_bot/widgets/IconButtonCard.dart';
import 'package:college_bot/widgets/customStack.dart';
import 'package:college_bot/widgets/historyCard.dart';
import 'package:college_bot/widgets/titledcardbutton.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    //precacheImage(AssetImage('images/profile_female.jpg'), context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      //extendBody: true,
      /* bottomNavigationBar: /*AnimatedBottomNavigationBar(
        
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

          ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        //borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(size: 40),
            unselectedIconTheme: IconThemeData(size: 25),
            currentIndex: navigationIndex,
            onTap: (value) {
              navigationIndex = value;
              setState(() {});
            },
            selectedItemColor: Colors.blue,
            elevation: 0,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Profile')
            ]),
      ),*/
      /*appBar: AppBar(
        bottomOpacity: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        //forceMaterialTransparency: false,
      ),*/
      body: SafeArea(
        child: ListView(
          children: [
            Stack(children: [
              ClipPath(
                clipper: CustomCurvedEdge(),
                child: Container(
                  height: 200,
                  padding: EdgeInsets.only(bottom: 14),
                  color: kblueHeaderColor,
                  child: ClipPath(
                    clipper: DiagonalPathClipperOne(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.lerp(kblueHeaderColor, Colors.black, 0.1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            child: Hero(
                              tag: 'profile',
                              child: Container(
                                width: 60,
                                height: 65,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'images/profile_female.jpg'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: kdefaultBackgroundColor,
                                      width: 1,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Omar Elmanzlawy,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 45, bottom: 45),
              child: Row(
                children: [
                  TitledCardButton(
                    title: 'Chat with \nCollegeBot',
                    chatType: ChatType.text,
                    icon: Icons.chat_bubble,
                    onpressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: TitledCardButton(
                      title: 'Talk with \nCollegeBot',
                      chatType: ChatType.voice,
                      icon: Icons.mic,
                      onpressed: () {
                        Navigator.pushNamed(context, '/voice');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 14.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: kblueTextColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Container(
                height: 350,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomStack(
                      question:
                          'What is the difference between Software Engineering and Information Systems?',
                      answer:
                          'adwadawdapwofjapwojfapowjfpaowjfpoawjfpoajwpofjapwojfpaowjfpoawj',
                    ),
                    CustomStack(
                      question: 'What is the northhampton dual degree program?',
                      answer: 'adwadawd',
                    ),
                    CustomStack(
                      question: 'What is GPA and how is it calculated?',
                      answer: 'adwadawd',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, top: 12),
              child: Text(
                'Other Services',
                style: kdashSubCategoryStyle,
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButtonCard(
                    text: 'Reset Password',
                    icon: Icons.key,
                    backgroundColor: Colors.deepOrange.shade50,
                    iconColor: Colors.deepOrange.shade300,
                  ),
                  IconButtonCard(
                    text: 'Course Registration',
                    icon: Icons.event_note,
                    backgroundColor: klightPurple,
                    iconColor: Colors.deepPurple.shade400,
                  ),
                  IconButtonCard(
                    text: 'Academic Advisor',
                    icon: Icons.school,
                    backgroundColor: klightyellow,
                    iconColor: Colors.amber.shade700,
                  ),
                  IconButtonCard(
                    text: 'Chatbot',
                    icon: Icons.smart_toy,
                    backgroundColor: klightGreen,
                    iconColor: Colors.lime.shade700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'History',
                style: kdashSubCategoryStyle,
              ),
            ),
            Stack(children: [
              Container(
                width: screenSize.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12),
                        child: Text(
                          'Today',
                          style: TextStyle(color: ksubtitleColor),
                        ),
                      ),
                    ),
                    HistoryCard(
                        question: 'How to extract an official execuse?',answer: 'gawqeigoawoieghawoihgoaiwehgoawihegaoiwehgoawihegoawiheg',),
                    //HistoryCard(question: 'When is my next Lecture?'),
                    HistoryCard(question: 'When is my next Lecture?', answer: 'gawqeigoawoieghawoihgoaiwehgoawihegaoiwehgoawihegoawiheg',),
                    HistoryCard(
                        question:
                            'What is the minimum gpa requirment to graduate?',answer: 'gawqeigoawoieghawoihgoaiwehgoawihegaoiwehgoawihegoawiheg',),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
