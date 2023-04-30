import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/logIn.dart';
import 'package:news/signIn.dart';
import 'package:news/verify.dart';

class DivertPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(("Hello"),),centerTitle: true,),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>SignIn()));
      }, child: Text("Log In"),),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>Verify()));
          }, child: Text("Sign Up")),
        )],),
    ),);
  }

}