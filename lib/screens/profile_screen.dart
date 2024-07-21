import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/backend/userAuth.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/ovalTopBorder.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double rating = 2.0;

    var ratingMap = {
      1.0: 'Bad',
      2.0: 'Okay',
      3.0: 'Good',
      4.0: 'Very Good',
      5.0: 'Excellent'
    };
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    String? ratingText = ratingMap[rating];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 310,
                //color: Colors.grey,
              ),
              ClipPath(
                clipper: OvalTopBorderClipper(),
                child: Container(
                  height: 250,
                  padding: EdgeInsets.all(0),
                  color: kblueHeaderColor,
                ),
              ),
              Positioned(
                top: 162,
                left: screenSize.width * 0.33,
                child: Hero(
                  tag: 'profile',
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile_female.jpg'),
                      radius: 70,
                    ),
                  ),
                ),
              ),
            ],
          ),

          FirebaseAuth.instance.currentUser!.emailVerified 
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AuthService.displayname ?? 'Null',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kblueProfileTextColor,
                      ),
                    ),
                    Image(
                      image: AssetImage('images/verified.png'),
                      width: 30,
                      height: 30,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      AuthService.displayname ?? 'Null',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kblueProfileTextColor,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Verify Now',
                        style: TextStyle(
                            color: kblueProfileTextColor.withOpacity(0.8),
                            decoration: TextDecoration.underline,
                            decorationColor: kblueProfileTextColor),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) => AlertDialog(
                                  title: Text('Email Verfication'),
                                  content: Text(
                                      'Do you want to verify this account?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          AuthService.verifyEmail(context);
                                        },
                                        child: Text('Send')),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: Text('Cancel'),
                                    )
                                  ],
                                )));
                      },
                    ),
                  ],
                ),

          //LIST TILES
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ListTile(
              leading: Icon(
                Icons.badge,
                color: kblueProfileTextColor,
              ),
              title: Text(
                'Edit Info',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: kblueProfileTextColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/editinfo');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ListTile(
              leading: Icon(
                Icons.reviews,
                color: kblueProfileTextColor,
              ),
              title: Text(
                'Review our app',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: kblueProfileTextColor,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((BuildContext context) => AlertDialog(
                          title: Text('Review'),
                          content: StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return SingleChildScrollView(
                              child: Center(
                                  child: Column(
                                children: [
                                  AnimatedRatingStars(
                                    onChanged: (double newRating) {
                                      rating = newRating;
                                      print(rating);
                                      setState(() {
                                        ratingText = ratingMap[rating];
                                        print(ratingText);
                                      });
                                    },
                                    customFilledIcon: Icons.star,
                                    customHalfFilledIcon: Icons.star,
                                    customEmptyIcon: Icons.star,
                                    initialRating: rating,
                                    minRating: 0.0,
                                    maxRating: 5.0,
                                    filledColor: kblueProfileTextColor,
                                  ),
                                  Text(ratingText ?? 'null')
                                ],
                              )),
                            );
                          }),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Thank you for your Review!',
                                        message: '',
                                        messageFontSize: 0,
                                        contentType: ContentType.success,
                                        color: Colors.lightBlue,
                                      ),
                                    ));
                                    Navigator.pop(context);
                                },
                                child: Text('Submit')),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                              child: Text('Cancel'),
                            )
                          ],
                        )));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: kblueProfileTextColor,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: kblueProfileTextColor,
              ),
              onTap: () {
                print('clicked');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: kblueProfileTextColor,
              ),
              title: Text(
                'About this app',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: kblueProfileTextColor,
              ),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'College Bot',
                    applicationVersion: 'Version: 0.1',
                    children: [
                      Container(
                        child: Text(
                          'CollegeBot is an AI-powered mobile application designed to assist college students throughout their academic journey.',
                          textAlign: TextAlign.justify,
                        ),
                        width: 50,
                        height: 80,
                      )
                    ]);
                print('clicked');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: ActionButton(
              text: 'Logout',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              onpressed: () async {
                showDialog(
                    context: context,
                    builder: ((BuildContext context) => AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  AuthService.logout(context);
                                },
                                child: Text('Logout')),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                              child: Text('Cancel'),
                            )
                          ],
                        )));
              },
            ),
          )
        ],
      ),
    );
  }
}
