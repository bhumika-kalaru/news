import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  // const Feed({super.key});
  String info = "";
  Feed(info);
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final List<String> data = [];

  void addItemToList() {
    // print(widget.info);
    setState(() {
      data.insert(0, widget.info);
    });
  }

  @override
  Widget build(BuildContext context) {
    addItemToList();
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list),
              title: Text(widget.info),
            );
          }),
    );
  }
}

