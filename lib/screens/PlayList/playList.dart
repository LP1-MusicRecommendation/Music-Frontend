
import 'package:flutter/material.dart';
import 'package:music_recommender/config/config.dart';
import 'package:music_recommender/models/genreScreenArguements.dart';
import 'package:music_recommender/models/songs.dart';
import 'package:music_recommender/models/users.dart';
import 'package:music_recommender/screens/widgets/genreCard.dart';
import 'package:music_recommender/screens/widgets/toast.dart';
import 'package:music_recommender/services/auth.dart';
import 'package:music_recommender/services/songs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayListWidget extends StatefulWidget {

  static const routeName = '/playList';


  const PlayListWidget({Key? key}) : super(key: key);

  @override
  _PlayListWidgetState createState() => _PlayListWidgetState();
}

class _PlayListWidgetState extends State<PlayListWidget> {

  late List<dynamic> songList = [];
  late User user;


  void getSongList() async{

    List<dynamic> temp = [];
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString('token').toString();
    String email = pref.getString('email').toString();
    try{
      temp = await getPlayList(email, token);
      setState(() {
        songList = temp;
      });
    }catch(e){
      showToast(e.toString());
    }

  }

  @override
  void initState() {
    // user = getUser();
    getSongList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('PlayList'),
        backgroundColor: secondary,
      ),
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ...container(),
            songList.length == 0
              ? Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 235, 60, 98),
              ),
            )
            : Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: songList.length,
                      itemBuilder: (context,index){
                        return Container(
                          child: GenreCard(song: songList[index],),
                        );
                      },
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,)
          ],
        ),
      ),
    );
  }
}
