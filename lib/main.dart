import 'package:flutter/material.dart';
import 'package:travel/routes/home/index.dart';

main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home()
      },
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          body2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          caption: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300)
        )
      ),
    );
  }
}