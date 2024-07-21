import 'package:college_bot/backend/userAuth.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/movieTicketClipper.dart';
import 'package:college_bot/widgets/gradeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../components/cart_model.dart';
import 'dart:math';

class GradesScreen extends StatefulWidget {

  
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {

 final Map<String,double> gradeMap = {'A+':12.0,'A': 11.5,'A-':11,'B+': 10,'B': 9,'B-': 8,'C+': 7,'C':6,'C-':5,'D+': 4,'D':3};
  Map<String,int> grades = {};
  @override
  Widget build(BuildContext context) {
    double gpa = 0.0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kdefaultBackgroundColor),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kbuttonGradient,
          ),
        ),
        //backgroundColor: kdefaultBackgroundColor,
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(gradient: kbuttonGradient),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: MediaQuery.of(context).size.width * 0.22,
                    child: Text(
                      "Grade Report",
                      style: TextStyle(
                          color: kdefaultBackgroundColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 12),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                  children: <TextSpan>[
                  TextSpan(text: 'Name: '),
                  TextSpan(text: AuthService.displayname,style: TextStyle(fontWeight: FontWeight.normal,color: kblueTextColor))
                  ]
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 5,bottom: 20),
                child: Text(
                  'Subjects:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              /*Expanded(
                
                child: GridView.count(
                  
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
                  children: [
                                  GradeCard(
                  subjectName: 'Deep Learning',
                  backgroundColor: Colors.purple,
                  grade: 'A+',
                  subjectCourse: 'CS124',
                ),
                                                GradeCard(
                  subjectName: 'Deep Learning',
                  backgroundColor: Colors.purple,
                  grade: 'A+',
                  subjectCourse: 'CS124',
                ),
                                                GradeCard(
                  subjectName: 'Deep Learning',
                  backgroundColor: Colors.purple,
                  grade: 'A+',
                  subjectCourse: 'CS124',
                ),
                                                GradeCard(
                  subjectName: 'Deep Learning',
                  backgroundColor: Colors.purple,
                  grade: 'A+',
                  subjectCourse: 'CS124',
                ),
                  ],
                  ),
              ),*/

              Expanded(
                child: GridView.builder(
                  itemCount: cartModel.cartItem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    final course = cartModel.cartItem[index];
                    final String grade = getRandomGrade();
                    final String creditHours = course[2];
                    grades[grade] = int.parse(creditHours);
                    print('In builder: $grades');
                    return 
                        GradeCard(
                      subjectName: course[0],
                      backgroundColor: course[3],
                      grade: grade,
                      subjectCourse: course[1],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0,bottom: 0,right: 0),
                child: Container(
                  height: 80,  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    color: Colors.blue,
                  ),
                  child: StatefulBuilder(
                    builder: (context, changeState) {
                      return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(elevation: MaterialStatePropertyAll(0)),
                            onPressed: (){
                              changeState(() {
                                print('CHANGESTATE');
                                gpa = calculateGpa();
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kdefaultBackgroundColor
                              ),
                              child: Center(child: Text('Calculate GPA',style: TextStyle(color:kblueTextColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                            ),
                          ),
                        ),
                        Text('GPA: ${gpa.toString()}',
                        style: TextStyle(
                          color: kdefaultBackgroundColor,
                          fontSize: 28
                        ),
                        )
                      ]
                    );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  String getRandomGrade() {
    final grades = ['A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+','D'];
    final random = Random();
    return grades[random.nextInt(grades.length)];
  }

  double calculateGpa(){
    print(grades);
    if(grades.isEmpty){
      return 0.0;
    }
    else{
      double totalGradePoints = 0.0;
      int totalCreditHours = 0;
      grades.forEach((grade, credithours) {
        totalGradePoints += gradeMap[grade]!;
        totalCreditHours += credithours;
      });

      return double.parse((totalGradePoints / totalCreditHours.toDouble()).toStringAsExponential(1));

    }
  }
}
