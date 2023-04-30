import 'package:flutter/material.dart';

import 'signIn.dart';
import 'feed.dart';

class AddNews extends StatefulWidget {
  const AddNews({super.key});

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final infoController = TextEditingController();

  void dispose() {
    infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: w / 10, vertical: h / 10),
            child: TextFormField(
              controller: infoController,
              decoration: const InputDecoration(hintText: "Info"),
            ),
          ),
          Container(
            child: IconButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => Feed(infoController.text.toString())),
                (Route<dynamic> route) => true,
              ),
              icon: Icon(
                Icons.add,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
