import 'package:flutter/material.dart';

class Customlogo extends StatelessWidget {
  const Customlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            "images/logo2.png",
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
