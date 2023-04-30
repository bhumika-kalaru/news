import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
  }

  Future ResetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      SnackBar(
        content: Text("Link Sent"),
      );
    } on FirebaseAuthException catch (e) {
      SnackBar(
        content: Text(e.message.toString()),
      );
      print("error");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w / 20, vertical: h / 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            GestureDetector(
              onTap: (() {
                ResetPassword();
              }),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: h / 80),
                height: h / 25,
                width: w / 4,
                child: Center(
                    child: Text(
                      "send link",
                      style: GoogleFonts.openSans(
                          color: white, fontWeight: FontWeight.w500, fontSize: 18),
                    )),
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
