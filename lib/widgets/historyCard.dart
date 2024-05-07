import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';

class HistoryCard extends StatelessWidget {
  final String question;

  HistoryCard({required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 380,minWidth: 380,maxHeight: 50),
                    width: 380,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(alignment: Alignment.centerLeft,child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(question,style: TextStyle(color: Colors.black),),
                          Icon(Icons.expand_more,color: Colors.black,)
                        ],
                      ),
                    )),
                  ),
                );
  }
}