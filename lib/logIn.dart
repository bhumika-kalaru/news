import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/DivertPage.dart';
import 'package:news/displayNews.dart';
import 'package:news/homePage.dart';
import 'package:news/signIn.dart';


class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DisplayNews();
          }
          return DivertPage();
        },
      ),
    );
  }
}
