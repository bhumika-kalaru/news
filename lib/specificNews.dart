import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class specificNewsInfo extends StatelessWidget {
  specificNewsInfo({required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description the the newsr'),
        backgroundColor: blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.r,
            children: [
              Center(
                  child: Text( description,
                      style: GoogleFonts.gabriela(fontSize: 24))),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
