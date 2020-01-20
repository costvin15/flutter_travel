import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CitiesListHeader extends StatelessWidget {
  final String text;

  CitiesListHeader({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.body2,
      ),
    );
  }
}

class CitiesList extends StatelessWidget {
  final cities = [
    {
      'title': 'Santa Monica Pier',
      'description': 'Downtown Santa Monica',
      'score': 4.7,
      'price': 20,
      'image': 'assets/santa-monica-pier.jpg'
    },
    {
      'title': 'Venice Beach',
      'description': 'Venice',
      'score': 4.9,
      'price': 15,
      'image': 'assets/venice-beach.jpg'
    },
    {
      'title': 'Venice Beach',
      'description': 'Venice',
      'score': 4.9,
      'price': 15,
      'image': 'assets/venice-beach.jpg'
    },
    {
      'title': 'Venice Beach',
      'description': 'Venice',
      'score': 4.9,
      'price': 15,
      'image': 'assets/venice-beach.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.compactSimpleCurrency();

    return Container(
      constraints: BoxConstraints(
        minHeight: 330,
        maxHeight: 352
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(
              left: 15.0,
              right: index + 1 == cities.length ? 15 : 0,
              bottom: 15.0
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2.0)
              ],
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 200,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 250,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(cities[index]['image'])
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cities[index]['title'], style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis),
                          Text(cities[index]['description'], style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis),
                          Row(
                            children: <Widget>[
                              Text(currencyFormat.format(cities[index]['price']), style: Theme.of(context).textTheme.title.apply(color: Colors.blue))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}