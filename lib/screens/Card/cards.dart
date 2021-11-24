import 'package:flutter/material.dart';

class GenreCards extends StatelessWidget {
  final String genres;
  GenreCards({required this.genres});

  @override
  Widget build(BuildContext context) {
    print(genres);
    return Container(
        height: 30,
        width: 30,
        child: InkWell(
          onTap: () {
            print(genres);
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
