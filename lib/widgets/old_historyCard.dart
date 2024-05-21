import 'package:flutter/material.dart';
import 'package:college_bot/constants.dart';

class HistoryCard2 extends StatelessWidget {
  final String question;

  HistoryCard2({required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Wrap(
        children: [
          Container(
            //constraints: BoxConstraints(maxWidth: 380, minWidth: 380, maxHeight: 50),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.expand_more,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}


//TODO: FIX TEXT OVERFLOW 