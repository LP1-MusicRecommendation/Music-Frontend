
import 'package:music_recommender/models/songs.dart';

class GenreScreenArguments{
  final String genreName;
  final List<Song> genreSongList;
  GenreScreenArguments({required this.genreName, required this.genreSongList});
}