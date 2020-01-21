import 'package:flutter/material.dart';
import 'package:travel/widgets/citiescard.dart';

class CitiesListHeader extends StatelessWidget {
  final String text;

  CitiesListHeader({
    Key key,
    @required this.text
  });

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
  final hotPlacesData = [
    {
      'title': 'Santa Monica Pier',
      'description': 'Downtown Santa Monica',
      'score': 1.7,
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

  List<Map<String, String>> hotelsData = [
    {
      'title': 'Santa Blue',
      'image': 'assets/santa-monica-pier.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 330,
        maxHeight: 340
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: hotPlacesData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: 15.0,
              right: index + 1 == hotPlacesData.length ? 15 : 0
            ),
            child: CitiesCard(
              title: hotPlacesData[index]['title'],
              description: hotPlacesData[index]['description'],
              image: hotPlacesData[index]['image'],
              price: hotPlacesData[index]['price'],
              score: hotPlacesData[index]['score'],
            ),
          );
        },
      ),
    );
  }

  Widget hotels(){
    return Container(
      constraints: BoxConstraints(
        minHeight: 330,
        maxHeight: 340
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: hotelsData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return CitiesCard.compact(
            title: hotelsData[index]['title'],
            image: hotelsData[index]['image']
          );
        },
      ),
    );
  }
}