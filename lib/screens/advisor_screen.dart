import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/components/cart_model.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/widgets/gradeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AdvisorScreen extends StatefulWidget {
  const AdvisorScreen({super.key});

  @override
  State<AdvisorScreen> createState() => _AdvisorScreenState();
}

class _AdvisorScreenState extends State<AdvisorScreen> {

  Map recommendations = {};

  List<GradeCard> recommendedCards = [];

  Future<void> fetchRecommendations()async{

    var url = Uri.https('omarelmanzalawy.pythonanywhere.com');
    var response = await http.get(url);
    print(response.statusCode.toString());
    if(response.statusCode == 200){
      recommendations = json.decode(response.body);
      print(recommendations);

      setState(() {
        
      });
    }
    else{
      ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error Fetching Data',
              message: 'please check your internet connection',
              messageFontSize: 0,
              contentType: ContentType.failure,
            ),
          ));
    }

  }

  void matchRecommendedGrades(CartModel cartModel){
    recommendations.forEach((courseCode, value) {
      String target = courseCode;
       for(List courseDetails in cartModel.courseItem){
          if(target == courseDetails[1]){
            
            recommendedCards.add(
              GradeCard(
                subjectName: courseDetails[0],
                 backgroundColor: courseDetails[3],
                 isCustomColor: true,
                 isPrediction: true,
                  grade: value.toString(),
                   subjectCourse: courseDetails[1])
            );
            break;
          }
          else{continue;}
       }
    });

  }

  @override
  void initState() {
    fetchRecommendations();
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) { 
          recommendedCards.isEmpty ? matchRecommendedGrades(cartModel) : null;       
      return Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomCurvedEdge(),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: kbuttonGradient
                    ),
                  ),

                ),
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Text('Recommended Courses',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600,color: kdefaultBackgroundColor),textAlign: TextAlign.center,),
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 220,left: 12,right: 12),
                  child: Text('These courses are generated based on the performance of other students that already finished these courses',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: kdefaultBackgroundColor),textAlign: TextAlign.justify,),
                )
              ],
            ),
            Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: recommendedCards.isEmpty ? 0 : recommendedCards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    /*final course = cartModel.cartItem[index];
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
                    );*/
                    print(recommendedCards.isEmpty.toString());
                    print(recommendedCards);
                    return recommendedCards[index];
                  },
                ),
              ),
          ]
        );
        }
      ),
    );
  }
}