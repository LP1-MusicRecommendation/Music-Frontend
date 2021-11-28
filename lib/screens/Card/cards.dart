import 'package:flutter/material.dart';
import 'package:music_recommender/models/genreScreenArguements.dart';
import 'package:music_recommender/models/songs.dart';
import 'package:music_recommender/models/users.dart';
import 'package:music_recommender/screens/GenreList/genre_list_widget.dart';
import 'package:music_recommender/screens/widgets/toast.dart';
import 'package:music_recommender/services/auth.dart';
import 'package:music_recommender/services/songs.dart';

class GenreCards extends StatefulWidget {
  final String genres;
  GenreCards({required this.genres});

  @override
  State<GenreCards> createState() => _GenreCardsState();
}

class _GenreCardsState extends State<GenreCards> {
  late User user;
  late List<Song> li = [];

  Future<void> getSongList() async {
    try {
      List<Song> temp = await getGenreSongs(widget.genres, user.token);
      temp.forEach((element) {
        li.add(element);
      });
    } catch (e) {
      print(e);
      showToast(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        child: InkWell(
          onTap: () async {
            await getSongList();
            Navigator.pushNamed(context, GenreListWidget.routeName,
                arguments: GenreScreenArguments(
                    genreName: widget.genres, genreSongList: li));
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
                    child: Text(widget.genres,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)))),
          ),
        ));
  }
}
