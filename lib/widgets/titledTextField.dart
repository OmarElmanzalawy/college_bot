import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final String hint;
  final Icon? suffixIcon;
  final Color? backgroundColor;

  TitledTextField({required this.title,required this.hint, this.backgroundColor,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0,top: 30,left: 12),
                child: Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              )
              ),
        TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                  suffixIcon: suffixIcon,
                  filled: true,
                  fillColor: backgroundColor ?? Colors.white,
                  //labelText: 'Student ID',
                  label: Text(hint),
                  //suffixIcon: Icon(Icons),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
      ]
    );
  }
}