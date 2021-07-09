import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventViews extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const EventViews({Key key, this.title, this.description, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Text('Description:',
            style: TextStyle(
              fontSize: 30,
            ),),
          SizedBox(height: 10),
          Center(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
