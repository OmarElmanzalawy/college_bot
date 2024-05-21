import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/ovalTopBorder.dart';
import 'package:college_bot/widgets/actionButton.dart';
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
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              'Full Name',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kblueProfileTextColor,
              ),
            ),
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
            child: ActionButton(text: 'Logout',backgroundColor: Colors.red,textColor: Colors.white,onpressed: (){
              //TODO: IMPLEMENT LOGOUT FUNCTIONALITY
            },),
          )
        ],
      ),
    );
  }
}
