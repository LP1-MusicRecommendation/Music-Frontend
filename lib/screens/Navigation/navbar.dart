import 'package:flutter/material.dart';
import 'package:music_recommender/screens/Home/home.dart';
import 'package:music_recommender/screens/Search/search.dart';
import 'package:music_recommender/screens/Profile/profile.dart';

class Navigation_page extends StatefulWidget {
  const Navigation_page({Key? key}) : super(key: key);

  @override
  _Navigation_pageState createState() => _Navigation_pageState();
}

class _Navigation_pageState extends State<Navigation_page> {
  int _selectedItemindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Color.fromRGBO(24, 25, 26, 1),
          child: Row(
            children: <Widget>[
              buildNavBar(Icons.home, 0),
              buildNavBar(Icons.search, 1),
              buildNavBar(Icons.person, 2),
            ],
          ),
        ),
        body: Builder(builder: (context) {
          if (_selectedItemindex == 0) return HomePage();
          if (_selectedItemindex == 1) return SearchPage();
          if (_selectedItemindex == 2) return ProfileScreen();
          return Container();
        }));
  }

  Widget buildNavBar(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemindex = index;
        });
      },
      child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width / 3,
          decoration: index == _selectedItemindex
              ? BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(235, 60, 98, 1), width: 4)),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(235, 60, 98, 0.3),
                    Color.fromRGBO(235, 60, 98, 0.015)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  // color: index == _selectedItemindex
                  //     ? Color.fromRGBO(235, 60, 98, 1)
                  //     : Color.fromRGBO(24, 25, 26, 1),
                  color: Colors.black,
                )
              : BoxDecoration(),
          child: Icon(
            icon,
            color: index == _selectedItemindex
                ? Color.fromRGBO(235, 60, 98, 1)
                : Colors.grey,
            size: 35,
          )),
    );
  }
}
