import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/AddNews.dart';
import 'package:news/calender.dart';

import 'constants.dart';
import 'logIn.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blue,
          title: Text('Profile'),
          centerTitle: true,
          actions: [IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                      (Route<dynamic> route) => false,
                );
              },
              icon: Icon(Icons.logout))],
          ),
      body: GestureDetector(
        child: Container(
          child: Center(
            child: Text("hello")
          ),
        ),
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNews()));
        },
      ),
    );
  }
}
