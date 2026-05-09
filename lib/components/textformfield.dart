import 'package:flutter/material.dart';

class customtextform extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool hidetext;
  final String? Function(String?)? validator;

  const customtextform({
    super.key,
    required this.hintText,
    required this.controller,
    required this.hidetext,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: hidetext,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 188, 182, 182),
          ),
        ),
      ),
    );
  }
}
