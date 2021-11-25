import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_recommender/models/songs.dart';

final String _url = "https://muzic-recommender.herokuapp.com";
late List<String> genreList = [];

Future<void> getGenreList(String token) async {
  final response = await http.get(
    Uri.parse(_url + '/songs/genres'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> tempList = jsonDecode(response.body);
    tempList.forEach((element) {
      genreList.add(element.toString());
    });
  } else {
    throw Exception("Could not show genre list");
  }
}

Future<List<Song>> getGenreSongs(String genreName, String token) async {
  final response = await http.post(
    Uri.parse(_url + '/songs/search'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
    body: jsonEncode(<String, String>{
      "Genre": genreName,
    }),
  );

  if (response.statusCode == 200) {
    List<Song> result = [];

    List<dynamic> tempList = jsonDecode(response.body);
    tempList.forEach((element) {
      result.add(Song.fromJson(element));
    });

    return result;
  } else {
    throw Exception("Could not show song list");
  }
}

Future<List<dynamic>> getAllSongs(String token) async {
  List<dynamic> result = [];
  return await http.get(
    Uri.parse(_url + '/songs/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
  ).then((http.Response res) async {
    if (res.statusCode == 200) {
      result = jsonDecode(res.body);
      print(result);
    } else {
      throw Exception("Could not show song list");
    }
    return result;
  });
}

List<String> getGenreArray() {
  return genreList;
}
