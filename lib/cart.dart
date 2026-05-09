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
    );
  }
}
