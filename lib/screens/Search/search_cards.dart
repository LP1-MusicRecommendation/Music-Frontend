import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_recommender/services/songs.dart';

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

  bool isAddedToPlayList = false;

  void addToPlaylist() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString('token').toString();
    String email = pref.getString('email').toString();
    await addToYourPlaylist(widget.id, token, widget.title, email);
    setState(() {
      isAddedToPlayList = !isAddedToPlayList;
    });
  }

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
                  isAddedToPlayList==true?Icons.bookmark_remove_sharp :Icons.bookmark_add,
                  color: Colors.blue,
                ),
                onPressed: addToPlaylist,
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
