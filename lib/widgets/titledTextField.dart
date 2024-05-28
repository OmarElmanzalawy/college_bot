import 'package:flutter/material.dart';

class TitledTextField extends StatefulWidget {
  final String title;
  final String hint;
  final Icon? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController controller;

  TitledTextField({required this.title,required this.hint, this.backgroundColor,this.suffixIcon,required this.controller});

  @override
  State<TitledTextField> createState() => _TitledTextFieldState();
}

class _TitledTextFieldState extends State<TitledTextField> { 

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
    print('disposed');
  }


@override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0,top: 20,left: 12),
                child: Text(widget.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              )
              ),
        TextField(
          controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: widget.suffixIcon,
                  filled: true,
                  fillColor: widget.backgroundColor ?? Colors.white,
                  //labelText: 'Student ID',
                  label: Text(widget.hint),
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

  String getText(){
    return widget.controller.text;
  }

}