import 'package:flutter/material.dart';
import 'package:travel/routes/home/widgets/searchbar.dart';
import 'package:travel/routes/home/widgets/topbar.dart';
import 'package:travel/widgets/bottomnavbar.dart';
import 'package:travel/widgets/citieslist.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: HomeTopBar(),
                ),
                // Creio que separar este widget em dois e transferir seus paddings para cá, melhorará a qualidade do código
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: HomeSearchBar(),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CitiesListHeader(text: '🔥 Hot Places'),
                ),
                CitiesList(),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CitiesListHeader(text: 'Hotels'),
                ),
                CitiesList().hotels()
              ],
            ),
          )
        ),
      ),
    );
  }
}