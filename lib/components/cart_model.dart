import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of Courses
  final List _Courses = [
    //CourseName,CourseCode,CourseHours,color
    ["Digital Ligthing", "GM111", "3", Colors.blue.shade900],
    ["Deep Learning", "BA101", "4 ", Colors.red.shade700],
    ["Computer Security", "BA201", "3 ", Colors.lightBlue],
    ["HCI", "CS451", "2 ", Colors.orange],
    ["Cloud Computing", "CS428", "3 ", Colors.blue],
    ["System Programming", "CS321", "4 ", Colors.pink],
    ["Theory of Computation", "CS111", "3", Colors.red],
    ["Calclus", "CS243", "3 ", Colors.green],
    ["Software Engineering", "BA216", "4 ", Colors.orange],
    ["Database Systems", "IS273", "3 ", Colors.blue],
    ['Object Oriented Programming','CS111','4',Colors.purple.shade800],
    ['Digital Logic Design','LH135','3',Colors.greenAccent.shade400],
    ['Advanced Physics','CS143','3',Colors.teal],
    ['Distributed Systems','BA203','3',Colors.deepOrangeAccent.shade400],
    ['Numerical Methods','CS243','3',Colors.yellow],
    ['Advanced Multimedia','IS171','3',Colors.blue],
  ];

  //List of cart Items
  List _cartitems = [];

  get courseItem => _Courses;
  get cartItem => _cartitems;

  //add item
  void addItem(int index) {
    _cartitems.add(_Courses[index]);
    notifyListeners();
  }

  //remove item
  void removeItem(int index) {
    _cartitems.removeAt(index);
    notifyListeners();
  }

  //Calc. totaal Credit Hours
  String CalculatorOfCreditHours() {
    int totalHours = 0;
    for (int i = 0; i < _cartitems.length; i++) {
      totalHours += int.parse(_cartitems[i][2]);
    }
    return totalHours.toString();
  }
}
