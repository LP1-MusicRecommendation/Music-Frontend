
import 'package:flutter/material.dart';
import 'package:music_recommender/config/config.dart';
import 'package:music_recommender/models/genreScreenArguements.dart';
import 'package:music_recommender/models/songs.dart';
import 'package:music_recommender/models/users.dart';
import 'package:music_recommender/screens/widgets/genreCard.dart';
import 'package:music_recommender/screens/widgets/toast.dart';
import 'package:music_recommender/services/auth.dart';
import 'package:music_recommender/services/songs.dart';

class GenreListWidget extends StatefulWidget {

  static const routeName = '/genre';


  const GenreListWidget({Key? key}) : super(key: key);

  @override
  _GenreListWidgetState createState() => _GenreListWidgetState();
}

class _GenreListWidgetState extends State<GenreListWidget> {

  late List<Song> songList = [];
  // late String genreName;
  // late User user;
  // void getSongsList() async{
  //   try{
  //     setState(() async{
  //       songList = await getGenreSongs(genreName, user.token);
  //     });
  //   }catch(e){
  //     showToast(e.toString());
  //   }
  // }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // user = getUser();
    // getSongsList();
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as GenreScreenArguments;
    // genreName = args.genreName;
    songList = [
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
      Song(title: 'Demons', artist: 'Imagine Dragons', genre:  args.genreName, year: 2014, duration: 5, popularity: 1000),
    ];


    List<Widget> buildGenreList(){
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
            SizedBox(height: MediaQuery.of(context).size.height*0.03,)
          ],
        ),
      ),
    );
  }
}
