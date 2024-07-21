import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradeCard extends StatelessWidget {

  final String subjectName;
  final String grade;
  final String subjectCourse;
  final Color backgroundColor;
  final bool? isCustomColor;
  final bool? isPrediction;

  GradeCard({required this.subjectName, required this.backgroundColor,required this.grade,required this.subjectCourse,this.isCustomColor,this.isPrediction});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 210,
        height: 135,
        decoration: BoxDecoration(
          gradient: isCustomColor ?? false ? null : kbuttonGradient,
          color: isCustomColor ?? false ?backgroundColor : null,
          //borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5,sigmaY: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Auto Size Doesn't work Check Documentation
                AutoSizeText(subjectName,
                
                style: TextStyle(color: kdefaultBackgroundColor,fontSize: 25,fontWeight: FontWeight.w500),
                ),
                Text(subjectCourse,style: TextStyle(color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isPrediction ?? false ? Container(width: 90,height: 40,child: Text('Predicted Grade',style: TextStyle(color: kdefaultBackgroundColor,fontSize: 15,fontWeight: FontWeight.w600),textAlign: TextAlign.start,)) : SizedBox(),
                    Padding(
                  padding: const EdgeInsets.only(top: 0.0,right: 12),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      children: [Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: Text(grade,
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 40,color: Colors.white),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
                  ],
                ),
                /*Padding(
                  padding: const EdgeInsets.only(top: 0.0,right: 12),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      children: [Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: Text(grade,
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 40,color: Colors.white),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),*/
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}