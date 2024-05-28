import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog {
  LoadingDialog._();

  static bool finishedLoading = false;

  static show(BuildContext context, String text) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: _customDialog(context, text),
          );
        });
  }

  static hide(BuildContext context) {
    finishedLoading
        ? Future.delayed(Duration(seconds: 10), () {
            print('waiting');
            Navigator.pop(context);
          })
        : Navigator.pop(context);
    //finishedLoading = false;
  }

  static _customDialog(BuildContext context, String text) {
    return Container(
      child: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                finishedLoading
                    ? Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Lottie.asset('animations/completed.json',
                                  repeat: true,
                                  frameRate: FrameRate.max,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 10),
                              child: Text(
                                text,
                                style: TextStyle(
                                    color: ksubtitleColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ))
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 80,
                            width: 80,
                            child: CircularProgressIndicator(
                              strokeWidth: 10,
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.blue.shade800),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 50, bottom: 10),
                              child: Text(
                                text,
                                style: TextStyle(
                                    color: ksubtitleColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ))
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
