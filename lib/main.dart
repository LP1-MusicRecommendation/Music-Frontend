import 'package:flutter/material.dart';
import 'package:music_recommender/screens/Authentication/authentication.dart';
import 'package:music_recommender/screens/Profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/auth' : (context) => const Authentication(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
