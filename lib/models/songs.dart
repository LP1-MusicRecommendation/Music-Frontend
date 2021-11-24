class Song {
  // final String id;
  final String title;
  final String artist;
  final String genre;
  final int year;
  final int duration;
  final int popularity;
  Song({required this.title, required this.artist, required this.genre, required this.year,required this.duration, required this.popularity});

  factory Song.fromJson(Map<String,dynamic> json){
    return Song(
      // id: json['_id'].toString(),
      title: json['title'].toString(),
      artist: json['artist'].toString(),
      genre: json['genre'].toString(),
      year: int.parse(json['year'].toString()),
      duration: int.parse(json['duration'].toString()),
      popularity: int.parse(json['popularity'].toString()),
    );
  }
}