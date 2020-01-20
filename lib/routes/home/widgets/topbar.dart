import 'package:flutter/material.dart';

class _LocationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(25.0)
      ),
      child: Icon(
        Icons.location_on,
        color: Colors.grey.withOpacity(.9),
      ),
    );
  }
}

class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Ready to travel,\nRebecca?', style: Theme.of(context).textTheme.body1),
          _LocationButton()
        ],
      )
    );
  }
}