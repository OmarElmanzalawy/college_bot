import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';

class TitledCardButton extends StatelessWidget {
  
  final String title;
  final IconData icon;
  final VoidCallback? onpressed;
  final Color? iconColor;

  TitledCardButton({required this.title,required this.icon,this.onpressed,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return  Stack(
              children: [
                GestureDetector(
                  onTap:  onpressed ?? (){print('Press');},
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: kbuttonGradient,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,top: 12),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.indigoAccent),
                        child: Icon(icon, color: iconColor ?? Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0,left: 9),
                      child: Row(
                        children: [
                          Text(title,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(left: 27.0,top: 4),
                            child: Icon(Icons.east,color: Colors.white,size: 25,),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
  }
}