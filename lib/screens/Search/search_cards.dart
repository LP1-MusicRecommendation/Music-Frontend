import 'package:flutter/material.dart';

class SearchCards extends StatefulWidget {
  const SearchCards({Key? key}) : super(key: key);

  @override
  _SearchCardsState createState() => _SearchCardsState();
}

class _SearchCardsState extends State<SearchCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(24, 25, 26, 1),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.music_note,
              color: Colors.blue,
            ),
            title: Text('The Enchanted Nightingale',
                style: TextStyle(
                    color: Color.fromRGBO(235, 60, 98, 1),
                    fontWeight: FontWeight.bold)),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.',
                style: TextStyle(color: Color.fromRGBO(235, 60, 98, 1))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.bookmark_add,
                  color: Colors.blue,
                ),
                onPressed: null,
              )
              //const Text('LISTEN'),

              ,
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
