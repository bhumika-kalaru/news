import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/displayNews.dart';

import 'constants.dart';
import 'logIn.dart';
import 'addNews.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blue,
          title: Text('Profile'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                        (Route<dynamic> route) => false,
                  );
                },
                icon: Icon(Icons.logout))
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )),
      body: Center(
        child: GestureDetector(
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayNews()));

          },child: Text("News"),)
        ),
      ),
    );
  }
}