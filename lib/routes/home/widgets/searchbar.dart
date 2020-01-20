import 'package:flutter/material.dart';

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 2.0
          ),
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'Search attractions in any city...',
          hintStyle: Theme.of(context).textTheme.caption
        ),
      ),
    );
  }
}

class TagCityList extends StatelessWidget {
  final items = [
    'Los Angeles',
    'San Francisco',
    'Miami',
    'New York'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            margin: EdgeInsets.only(
              left: 15,
              right: index + 1 == items.length ? 15 : 0
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(
              items[index],
              style: Theme.of(context).textTheme.caption.apply(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            child: _SearchBar()
          ),
          TagCityList()
        ],
      ),
    );
  }
}