import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/ovalTopBorder.dart';
import 'package:college_bot/widgets/actionButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
          Text(
            'Full Name',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kblueProfileTextColor,
            ),
          ),
          FirebaseAuth.instance.currentUser!.emailVerified ? SizedBox() :
          TextButton(child: 
          Text('Verify Now', style: TextStyle(color: kblueProfileTextColor.withOpacity(0.8),decoration: TextDecoration.underline,decorationColor: kblueProfileTextColor),), 
          onPressed: (){

          showDialog(context: context, 
          builder: ((BuildContext context) => AlertDialog(
            title: Text('Email Verfication'),
            content: Text('Do you want to verify this account?'),
            actions: [
              TextButton(onPressed: () async{
                try{
                await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                }
                on FirebaseAuthException catch(e){
                  if(e.code == 'too-many-requests'){
                      ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Already Sent',
                          message: 'An email has already been sent to you',
                          contentType: ContentType.failure,
                        ),
                      ));
                  }
                }
                Navigator.pop(context,'Send');
                        ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Check your email!',
                          message: 'Verification link has been sent to your email.',
                          contentType: ContentType.success,
                          color: Colors.lightBlue,
                        ),
                      ));
              }, 
              child: Text('Send')),

              TextButton(onPressed: (){Navigator.pop(context,'Cancel');}, child: Text('Cancel'),)
            ],
          ))

          );  

          },),

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
                print('clicked');
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
                'Feedback',
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
            padding: const EdgeInsets.only(top: 160.0),
            child: ActionButton(
              text: 'Logout',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              onpressed: () async {
                //TODO: IMPLEMENT LOGOUT FUNCTIONALITY
                await FirebaseAuth.instance.signOut();
                //TODO DISPLAY SNACK BAR OR LOADING INDICATOR UNTILL LOGOUT IS COMPLETED
                Navigator.pushNamed(context, '/signin');
              },
            ),
          )
        ],
      ),
    );
  }
}
