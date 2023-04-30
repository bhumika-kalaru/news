import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/displayNews.dart';
import 'constants.dart';

class AddNews extends StatefulWidget {
  @override
  State<AddNews> createState() => _AddNewsState();
}

DateTime _dateTime = DateTime(2000);


class _AddNewsState extends State<AddNews> {
  final descontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text('Add News'),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.check),
            onTap: () {
              createNews(descript: descontroller.text,date: _dateTime);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayNews()));
            },
          ),
        ],
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: descontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descrption of the News',
                  ),
                ),
              ),
            ),
            Container(
              height: 90,
              width: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Center(
                    child: GestureDetector(
                      onTap: ()async {
                        DateTime? _newdate = await showDatePicker(
                            context: context,
                            initialDate: _dateTime,
                            firstDate: DateTime(1800),
                            lastDate: DateTime(3000));
                        if (_newdate != null) {
                          setState(() {
                            _dateTime = _newdate;
                          });
                        }
                      },
                      child: Text("Add Date"),
                    )
                ),
              ),
            ),
            SizedBox(
              height: 18,
            )
          ],
        ),
      ),
    );
  }

  Stream<List<News>> readUsers() => FirebaseFirestore.instance
      .collection('News')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => News.fromJson(doc.data())).toList());

  Future createNews(
      {required String descript,required DateTime date}) async {
    final docNews = FirebaseFirestore.instance.collection('News').doc();
    final news = News(
      id: docNews.id,
      description: descript,
      date: date,
    );
    final json = news.toJson();
    await docNews.set(json);
  }
}

class News {
  late String id;
  final String description;
  final DateTime date;
  News({this.id = '', required this.description,required this.date });

  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'date':date,
  };
  static News fromJson(Map<String, dynamic> json) => News(
    id: json['id'],
    date: json['date'],
    description: json['description'],);
}
