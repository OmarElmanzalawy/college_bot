import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';

class IconButtonCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? backgroundColor;

  IconButtonCard({required this.text,required this.icon, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              gradient: kbuttonGradient,
              color: backgroundColor ?? Colors.grey.shade900,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 10,color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
