import 'package:flutter/material.dart';

class SearchCards extends StatefulWidget {
  String id = '';
  String title = '';
  String name = '';
  SearchCards(
      {Key? key, required this.id, required this.title, required this.name})
      : super(key: key);

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
          ListTile(
            leading: Icon(
              Icons.music_note,
              color: Colors.blue,
            ),
            title: Text(widget.title,
                style: TextStyle(
                    color: Color.fromRGBO(235, 60, 98, 1),
                    fontWeight: FontWeight.bold)),
            subtitle: Text('Music by ${widget.name}.',
                style: TextStyle(color: Color.fromRGBO(235, 60, 98, 1))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.bookmark_add,
                  color: Colors.blue,
                ),
                onPressed: null,
              )
              //const Text('LISTEN'),

              ,
              SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
