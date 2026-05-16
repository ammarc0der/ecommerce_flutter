import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List cart;
  final Function removeFromCart;

  const CartPage({super.key, required this.cart, required this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset(cart[i]["image"], width: 50),
            title: Text(cart[i]["name"]),
            subtitle: Text(cart[i]["price"]),
            trailing: IconButton(
              onPressed: () {
                removeFromCart(i);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
      bottomNavigationBar: cart.isEmpty
          ? null
          : Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Order Confirmed ✅"),
                      content: Text("Your order has been placed successfully!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            for (int i = 0; i < cart.length; i++) {
                              removeFromCart(i);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("purchase successfully!"), 
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
