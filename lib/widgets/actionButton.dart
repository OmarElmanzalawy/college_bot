import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';
import 'package:flutter/widgets.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onpressed;
  final Color? textColor;

  ActionButton(
      {required this.text,
      this.backgroundColor,
      this.onpressed,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), gradient: kbuttonGradient),
      child: ElevatedButton(
        style: ButtonStyle(
          //FIX SHADOW COLOR
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(textColor) ??
              MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              //side: BorderSide(color: Colors.black)
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor ?? Colors.transparent),
          elevation: MaterialStateProperty.all(8),
        ),
        onPressed: onpressed ?? () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 150, vertical: 14),
          child: Text(
            text,
            style: kdefaultText.copyWith(),
          ),
        ),
      ),
    );
  }
}
