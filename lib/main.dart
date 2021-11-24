import 'package:flutter/material.dart';
import 'package:music_recommender/screens/Authentication/authentication.dart';
import 'package:music_recommender/screens/Home/home.dart';
import 'package:music_recommender/screens/Navigation/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/nav',
      routes: {'/nav': (context) => const Navigation_page()},
    );
  }
}
