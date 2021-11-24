import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:music_recommender/screens/Search/search_cards.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var songs = [
    'Pop',
    'Classical',
    'Rock',
    'Heavy metal',
    'Hip-hop',
    'Ambience',
  ];

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 10, left: 10),

                  /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
                  /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
                  child: AnimSearchBar(
                    width: 400,
                    color: Colors.grey,
                    textController: textController,
                    onSuffixTap: () {
                      setState(() {
                        textController.clear();
                      });
                    },
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            print(songs.length);
                            print(songs[index]);
                            return Container(
                              child: SearchCards(),
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

  // Widget searchBarUI() {
  //   return FloatingSearchBar(
  //     hint: 'Search.....',
  //     openAxisAlignment: 0.0,
  //     // maxWidth: 600,
  //     axisAlignment: 0.0,
  //     scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
  //     elevation: 4.0,
  //     physics: BouncingScrollPhysics(),
  //     onQueryChanged: (query) {
  //       //Your methods will be here
  //     },
  //     // showDrawerHamburger: false,
  //     transitionCurve: Curves.easeInOut,
  //     transitionDuration: Duration(milliseconds: 500),
  //     transition: CircularFloatingSearchBarTransition(),
  //     debounceDelay: Duration(milliseconds: 500),
  //     actions: [
  //       FloatingSearchBarAction(
  //         showIfOpened: false,
  //         child: CircularButton(
  //           icon: Icon(Icons.place),
  //           onPressed: () {
  //             print('Places Pressed');
  //           },
  //         ),
  //       ),
  //       FloatingSearchBarAction.searchToClear(
  //         showIfClosed: false,
  //       ),
  //     ],
  //     builder: (context, transition) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(8.0),
  //         child: Material(
  //           color: Colors.white,
  //           child: Container(
  //             height: 200.0,
  //             color: Colors.white,
  //             child: Column(
  //               children: [
  //                 ListTile(
  //                   title: Text('Home'),
  //                   subtitle: Text('more info here........'),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
