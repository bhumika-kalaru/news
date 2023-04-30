import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


DateTime _dateTime = DateTime(2000);

class Calender extends StatelessWidget {
  Calender({super.key,required this.date,required this.time});
  DateTime date;
  TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: ()async {
              final Event event = Event(
                title: 'Event title',
                description: 'Event description',
                location: 'Event location',
                startDate: date,
                endDate: date,
                androidParams: AndroidParams(
                  emailInvites: ["bhumikakalaru@gmail.com"], // on Android, you can add invite emails to your event.
                ),
              );
              Add2Calendar.addEvent2Cal(event);
              print("added");
            },
            child: Center(
              child: Container(
                color: Colors.blue,
                height:100,width:100,
                child: Text("Add"),
              ),
            )
          ),
        ],
      ),
    );
  }
}