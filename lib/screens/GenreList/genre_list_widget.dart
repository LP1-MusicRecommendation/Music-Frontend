import 'package:flutter/material.dart';
import 'package:music_recommender/config/config.dart';
import 'package:music_recommender/models/genreScreenArguements.dart';
import 'package:music_recommender/models/songs.dart';
import 'package:music_recommender/screens/widgets/genreCard.dart';

class GenreListWidget extends StatefulWidget {
  static const routeName = '/genre';

  const GenreListWidget({Key? key}) : super(key: key);

  @override
  _GenreListWidgetState createState() => _GenreListWidgetState();
}

class _GenreListWidgetState extends State<GenreListWidget> {
  late List<Song> songList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as GenreScreenArguments;
    // genreName = args.genreName;
    songList = [
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
      Song(
          title: 'Demons',
          artist: 'Imagine Dragons',
          genre: args.genreName,
          year: 2014,
          duration: 5,
          popularity: 1000),
    ];

    setState(() {
      songList = args.genreSongList;
    });

    List<Widget> buildGenreList() {
      return songList.map((e) => GenreCard(song: e)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(args.genreName),
        backgroundColor: secondary,
      ),
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...buildGenreList(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
