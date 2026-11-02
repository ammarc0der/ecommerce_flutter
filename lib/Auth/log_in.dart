import 'package:ecommerce/components/custombutton.dart';
import 'package:ecommerce/components/customlogo.dart';
import 'package:ecommerce/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Customlogo(), // Custom logo widget
                  SizedBox(height: 20),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "login to continue using the app",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  customtextform(
                    hintText: "Enter the Email",
                    controller: email,
                    hidetext: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  Text(
                    "password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),
                  customtextform(
                    hintText: "Enter the password",
                    controller: password,
                    hidetext: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.topRight,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Forget password?",
                      style: TextStyle(fontSize: 14, color: Colors.blue[700]),
                    ),
                  ),
                ],
              ),

              Custombutton(
                title: "login",
                onPressed: () async {
                  // تشغيل الـ validator
                  // if (_formKey.currentState!.validate()) {
                  //   try {

                  //     final credential = await FirebaseAuth.instance
                  //         .signInWithEmailAndPassword(
                  //       email: email.text.trim(),
                  //       password: password.text.trim(),
                  //     );

                  //     if (!context.mounted) return;
                  //     await credential.user!.reload();
                  //     if (!context.mounted) return;

                  //     if (credential.user!.emailVerified) {                       // the email verified
                  //       Navigator.of(context).pushReplacementNamed("homepage");
                  //     }else{
                  //       AwesomeDialog(
                  //         context: context,
                  //         dialogType: DialogType.info,
                  //         animType: AnimType.rightSlide,
                  //         title: 'Email not verified',
                  //         desc: 'Please verify your email to continue',
                  //         btnCancelOnPress: () {},
                  //         btnOkOnPress: () {
                  //           Navigator.of(context).pushReplacementNamed("homepage");
                  //         },
                  //         )..show();
                  //     }
                  //   } on FirebaseAuthException catch (e) {
                  //     if (e.code == 'invalid-credential') {
                  //       AwesomeDialog(
                  //         context: context,
                  //         dialogType: DialogType.info,
                  //         animType: AnimType.rightSlide,
                  //         title: 'Invalid credentials',
                  //         desc: 'Please enter a valid email and password',
                  //         btnCancelOnPress: () {},
                  //         btnOkOnPress: () {
                  //           Navigator.of(context).pushReplacementNamed("homepage");
                  //         },
                  //       )..show();
                  //     }
                  //   }
                  //     }

                  Navigator.of(context).pushReplacementNamed("homepage");
                },
              ),

              SizedBox(height: 20),

              MaterialButton(
                color: Colors.white,
                textColor: Colors.black,
                height: 40,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" or login with"),
                    Image.asset("images/google.jpg", width: 20, height: 20),
                  ],
                ),
              ),

              SizedBox(height: 10),

              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("signup");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),

                    Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
