import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:music_recommender/screens/Search/search_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_recommender/services/songs.dart';
import 'package:music_recommender/screens/widgets/toast.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> songs = [];

  void preset() async {
    List<dynamic> temp = [];
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString('token').toString();
    try {
      temp = await getAllSongs(token);
      setState(() {
        songs = temp;
      });
    } catch (e) {
      showToast(e.toString());
    }
  }

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    preset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String searchText = '';
    return Scaffold(
        appBar: AppBar(
          title: Text('Search your favourite song!',
              style: TextStyle(
                  color: Colors.grey[350], fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromRGBO(235, 60, 98, 1),
        ),
        backgroundColor: Color.fromRGBO(24, 25, 26, 1),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.pinkAccent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent),
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(235, 60, 98, 1),
                            ),
                          )),
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                        print(searchText);
                      },
                    ),
                  ),
                ),
                songs.length == 0
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
                                itemCount: songs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: SearchCards(
                                      id: songs[index]['_id'],
                                      title: songs[index]['Title'],
                                      name: songs[index]['Artist'],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
