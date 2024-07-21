import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:college_bot/constants.dart';
import 'package:college_bot/curves/customCurvedEdge.dart';
import 'package:college_bot/curves/diagonalPathClipper1.dart';
import 'package:college_bot/curves/movieTicketClipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../components/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:college_bot/screens/dashboard.dart'; // Import the DashboardScreen

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kdefaultBackgroundColor),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kbuttonGradient,
          ),
        ),
        //backgroundColor: kdefaultBackgroundColor,
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(gradient: kbuttonGradient),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Registered Courses",
                      style: TextStyle(
                          color: kdefaultBackgroundColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItem.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Text(value.cartItem[index][0]),
                          title: Text(value.cartItem[index][1]),
                          subtitle:
                              Text('Course Code:' + value.cartItem[index][2]),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () => Provider.of<CartModel>(
                              context,
                              listen: false,
                            ).removeItem(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //total credit hours + button
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: kbuttonGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Credit Hours",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            value.CalculatorOfCreditHours(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Registered Successfully',
                                message: '',
                                messageFontSize: 0,
                                contentType: ContentType.success,
                                color: Colors.lightBlue,
                              ),
                            ));
                        },
                        child: Row(
                          children: const [
                            Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
