import 'package:flutter/material.dart';
import 'package:music_recommender/models/genreScreenArguements.dart';
import 'package:music_recommender/screens/Card/cards.dart';
import 'package:music_recommender/screens/GenreList/genre_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var genres = [
    'Pop',
    'Classical',
    'Rock',
    'Heavy metal',
    'Hip-hop',
    'Ambience'
  ];

  final List<String> _listItem = [
    'assets/images/art1.png',
    'assets/images/art1.png',
    'assets/images/art1.png',
    'assets/images/art1.png',
    'assets/images/art1.png',
    'assets/images/art1.png',
    'assets/images/art1.png',
    'assets/images/art1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(24, 25, 26, 1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/temp_icon.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        // Colors.grey.withOpacity(.3),
                        // Colors.grey.withOpacity(.2),
                        Color.fromRGBO(235, 60, 98, 0.3),
                        Color.fromRGBO(235, 60, 98, 0.015)
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Rock It!",
                        style: TextStyle(
                            color: Color.fromRGBO(235, 60, 98, 1),
                            fontSize: 30,
                            fontFamily: 'Rockit',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        child: Center(
                            child: Text(
                          "Our Genres",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: genres.map((genre) {
                      return GenreCards(genres: genre);
                    }).toList()),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
