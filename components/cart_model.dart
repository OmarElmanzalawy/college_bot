import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of Courses
  final List _Courses = [
    //CourseName,CourseCode,CourseHours,color
    ["Digital Ligthing", "GM424", "3", Colors.pink],
    ["Deep Learning", "CS460", "4 ", Colors.red],
    ["Computer Security", "CS421", "3 ", Colors.green],
    ["HCI", "CS451", "2 ", Colors.orange],
    ["Cloud Computing", "CS428", "3 ", Colors.blue],
    ["system programming", "CS321", "4 ", Colors.pink],
    ["Theory of Computation", "CS311", "3", Colors.red],
    ["Calclus", "BA102", "3 ", Colors.green],
    ["Intro to Software Engineering", "SE291", "4 ", Colors.orange],
    ["Database Systems", "IS273", "3 ", Colors.blue],
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
