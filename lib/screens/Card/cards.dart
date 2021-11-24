import 'package:flutter/material.dart';
import 'package:music_recommender/models/genreScreenArguements.dart';
import 'package:music_recommender/screens/GenreList/genre_list_widget.dart';

class GenreCards extends StatelessWidget {
  final String genres;
  GenreCards({required this.genres});

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 30,
        width: 30,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, GenreListWidget.routeName,arguments: GenreScreenArguments(genreName: genres));
          },
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/art1.png'),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Text(genres,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)))),
          ),
        ));
  }
}
