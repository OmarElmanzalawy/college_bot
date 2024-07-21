import 'package:college_bot/components/cart_model.dart';
import 'package:college_bot/components/courses_item_title.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPage();
          })),
          backgroundColor: Colors.lightBlue,
          child: Icon(Icons.done,color: Colors.white,),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 48),
              //register courses
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Course Registration",
                    style: TextStyle(fontSize: 40),
                  )),

              //divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 4,
                ),
              ),
              const SizedBox(height: 24),

              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Choose Courses",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.courseItem.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CourseItemTitle(
                        CourseName: value.courseItem[index][0],
                        CourseCode: value.courseItem[index][1],
                        CourseHours:
                            '${value.courseItem[index][2]} Credit Hours',
                        color: value.courseItem[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItem(index);
                        },
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ));
  }
}
