import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/specificNews.dart';
import 'addNews.dart';
import 'constants.dart';

class DisplayNews extends StatefulWidget {
  const DisplayNews({Key? key}) : super(key: key);

  @override
  State<DisplayNews> createState() => _DisplayNewsState();
}

late double h,w;

class _DisplayNewsState extends State<DisplayNews> {
  @override
  Widget build(BuildContext context) {

     h = MediaQuery.of(context).size.height;
        w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text('News'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNews()));
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 15),
          SizedBox(
            width: 5,
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: StreamBuilder<List<News>>(
              stream: readUsers(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final news = snapshot.data!;
                  return ListView(
                    children: news.map(buildUser).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUser(News n) => GestureDetector(
    child: Container(
      // height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: white,
          boxShadow: blueShadow,
          borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                width: w*0.75,
                child: Center(
                  child: Text(
                    n.description,
                    style: GoogleFonts.gabriela(
                      fontSize: 20,

                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {

                      final doc = FirebaseFirestore.instance
                          .collection('News')
                          .doc(n.id);
                      doc.delete();
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
            ],
          ),
        ],
      ),
    ),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  specificNewsInfo(news: n)));
    },
  );
  Stream<List<News>> readUsers() => FirebaseFirestore.instance
      .collection('News')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => News.fromJson(doc.data())).toList());

}
