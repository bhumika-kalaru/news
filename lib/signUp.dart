import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/displayNews.dart';
import 'package:news/signIn.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class SignUp extends StatefulWidget {
  SignUp({required this.email, super.key});
String email;

@override
State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: w / 10, vertical: h / 40),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: w / 10, vertical: h / 40),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: h / 80),
              height: h / 25,
              width: w / 4,
              child: Center(
                  child: Text(
                    "Submit",
                    style: GoogleFonts.openSans(
                        color: white, fontWeight: FontWeight.w500, fontSize: 18),
                  )),
              decoration: BoxDecoration(
                  color: blue, borderRadius: BorderRadius.circular(10)),
            ),
            onTap: () {
              setState(() {
                signUp();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayNews()),
                      (Route<dynamic> route) => false,
                );
              });
            },
          ),
          GestureDetector(
            child: RichText(
                text: TextSpan(
                    text: 'Already a user?!',
                    style: GoogleFonts.openSans(color: black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "LogIn",
                        style: GoogleFonts.openSans(color: blue, fontSize: 16),
                      )
                    ])),
            onTap: (() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            }),
          )
        ],
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .catchError((error) => print(error));
      ;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
