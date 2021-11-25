import 'package:flutter/material.dart';
import 'package:music_recommender/screens/Authentication/authentication.dart';
import 'package:music_recommender/screens/GenreList/genre_list_widget.dart';
import 'package:music_recommender/screens/Navigation/navbar.dart';
import 'package:music_recommender/screens/Profile/profile.dart';
import 'package:music_recommender/screens/Splash/splashScreen.dart';

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
        '/auth': (context) => const Authentication(),
        '/profile': (context) => const ProfileScreen(),
        '/nav': (context) => const Navigation_page(),
        GenreListWidget.routeName: (context) => const GenreListWidget(),
        SplashScreen.routeName: (context) => const SplashScreen()
      },
    );
  }
}
