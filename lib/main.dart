import 'package:ecommerce/Auth/log_in.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/Auth/sign_up.dart';
import 'package:ecommerce/homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        "signup": (context) => SignUp(),
        "login": (context) => LogIn(),
        "homepage": (context) => Homepage(
          onThemeChanged: (val) {
            setState(() {
              isDarkMode = val;
            });
          },
        ),
      },
      home: LogIn(),
    );
  }
}
