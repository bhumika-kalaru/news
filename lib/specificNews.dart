import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addNews.dart';
import 'constants.dart';

class specificNewsInfo extends StatelessWidget {
  specificNewsInfo({required this.news});
  final News news;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text( news.description,
                      style: GoogleFonts.gabriela(fontSize: 24))),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          final doc = FirebaseFirestore.instance
              .collection('News')
              .doc(news.id);
          doc.delete();
          Navigator.pop(context);
        },
        child: Icon(Icons.close),
      ),
    );
    ;
  }
}
