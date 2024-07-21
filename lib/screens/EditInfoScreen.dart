import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/curves/diagonalPathClipper1.dart';
import 'package:college_bot/curves/ovalTopBorder.dart';
import 'package:college_bot/curves/waveClipper.dart';
import 'package:college_bot/widgets/titledTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/widgets.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({super.key});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblueHeaderColor,
        iconTheme: IconThemeData(color: Colors.white),
        ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 500,
                    color: kblueHeaderColor,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 135.0),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: kdefaultBackgroundColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      title: Text(
                        'Display Name',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: kblueHeaderColor,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) => AlertDialog(
                                  title: Text('Change Name'),
                                  content: TextField(
                                    controller: nameController,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          
                                          if (nameController.text.isNotEmpty) {
                                            try {
                                              await FirebaseAuth
                                                  .instance.currentUser
                                                  ?.updateDisplayName(
                                                      nameController.text);
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Name Updated',
                                                    message: '',
                                                    contentType:
                                                        ContentType.success,
                                                    color: Colors.lightBlue,
                                                  ),
                                                ));
                                            } on FirebaseAuthException catch (e) {
                                              if(e.code == 'network-request-failed'){
                                                ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Network Problem',
                                                    message: '',
                                                    contentType:
                                                        ContentType.failure,
                                                  ),
                                                ));
                                                Navigator.pop(context);
                                              }
                                              print('code ${e.code}');
                                            }
                                          }
                                        },
                                        child: Text('Change')),
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
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      title: Text(
                        'Registration Number',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: kblueHeaderColor,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) => AlertDialog(
                                  title: Text('Change Registration Number'),
                                  content: TextField(
                                    controller: nameController,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          
                                          Navigator.pop(context);
                                           ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Registration Number Changed',
                                                    message: '',
                                                    contentType:
                                                        ContentType.success,
                                                        color: Colors.lightBlue,
                                                  ),
                                                )); 
          
                                        },
                                        child: Text('Change')),
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
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      title: Text(
                        'Change Password',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: kblueHeaderColor,
                      ),
                      onTap: () {

                        showDialog(
                            context: context,
                            builder: ((BuildContext context) => AlertDialog(
                                  title: Text('Change Password'),
                                  content: TextField(
                                    controller: passwordController,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          try{
                                            if(passwordController.text.isNotEmpty){
                                           await FirebaseAuth.instance.currentUser?.updatePassword(passwordController.text);
                                           Navigator.pop(context);
                                           ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Password Changed',
                                                    message: '',
                                                    contentType:
                                                        ContentType.success,
                                                        color: Colors.lightBlue,
                                                  ),
                                                )); 
                                            }
                                          }
                                          on FirebaseAuthException catch(e){

                                            if(e.code == 'network-request-failed'){
                                                ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Network Problem',
                                                    message: '',
                                                    contentType:
                                                        ContentType.failure,
                                                  ),
                                                ));
                                                Navigator.pop(context);
                                              }
                                            else{
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Error Occured',
                                                    message: 'Please try again later',
                                                    contentType:
                                                        ContentType.failure,
                                                  ),
                                                ));
                                                Navigator.pop(context);
                                              print('Error code: ${e.code}');
                                            }
                                          }                     
                                        },
                                        child: Text('Change')),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
