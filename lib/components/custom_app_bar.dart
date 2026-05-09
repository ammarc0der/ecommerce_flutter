import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sunny, color: Colors.amber[700], size: 30),
          Text(
            "  Gipsy ",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Bee",
            style: TextStyle(
              color: Colors.amber[700],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
