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
        title: Text("Registered Courses"),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
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
                    color: Color.fromARGB(255, 24, 207, 204),
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
                        },
                        child: Row(
                          children: const [
                            Text(
                              "Done",
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
