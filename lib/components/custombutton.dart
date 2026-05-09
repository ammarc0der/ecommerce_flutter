import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const Custombutton({super.key, this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow[700],
      textColor: Colors.black,
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
