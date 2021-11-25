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

    print(json);

    return Song(
      // id: json['_id'].toString(),
      title: json['Title'].toString(),
      artist: json['Artist'].toString(),
      genre: json['Genre'].toString(),
      year: int.parse(json['Year'].toString()),
      duration: int.parse(json['Duration'].toString()),
      popularity: int.parse(json['Popularity'].toString()),
    );
  }
}