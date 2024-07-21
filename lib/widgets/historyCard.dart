import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryCard extends StatelessWidget {
  
  final String question;
  final String answer;
  final Color? backgroundColor;

  HistoryCard({required this.answer,required this.question,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ExpansionTile(
          title: Text(question),
          backgroundColor: backgroundColor ?? Colors.transparent,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('gawqeigoawoieghawoihgoaiwehgoawihegaoiwehgoawihegoawiheg',style: TextStyle(color: ksubtitleColor),),
            ),
          ],
          shape: Border.all(style: BorderStyle.none),
          ),
        ),
      ]
    );
  }
}