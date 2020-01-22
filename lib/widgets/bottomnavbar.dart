import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 4.0)
        ]
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.home, size: 30.0, color: Colors.blue),
          Icon(Icons.search, size: 30.0, color: Colors.grey),
          Icon(Icons.person, size: 30.0, color: Colors.grey)
        ],
      ),
    );
  }
}