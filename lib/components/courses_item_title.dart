import 'package:flutter/material.dart';

class CourseItemTitle extends StatelessWidget {
  final String CourseName;
  final String CourseCode;
  final String CourseHours;
  final Color color;
  void Function()? onPressed;

  CourseItemTitle({
    super.key,
    required this.CourseName,
    required this.CourseCode,
    required this.CourseHours,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color.withOpacity(0.5), borderRadius: BorderRadius.circular(12)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //course name
          Text(
            CourseName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),

          //course credit hours
          Text(CourseHours, style: TextStyle(fontSize: 13)),

          //course code
          MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                CourseCode,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
