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
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(235, 60, 98, 0.3),
                      Color.fromRGBO(235, 60, 98, 0.015)
                    ]
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/female_singing.png'),
                        //fit: BoxFit.cover
                        )),
                child: Center(
                    child: Text(genres,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)))),
          ),
        ));
  }
}
