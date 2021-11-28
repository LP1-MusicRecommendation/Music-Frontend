import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_recommender/config/config.dart';
import 'package:music_recommender/models/songs.dart';

class GenreCard extends StatefulWidget {
  final Song song;

  const GenreCard({Key? key, required this.song}) : super(key: key);

  @override
  _GenreCardState createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Widget info(IconData data, String value, Color color) {
      return Row(
        children: [
          Icon(
            data,
            size: 20,
            color: color,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          )
        ],
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.song.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: secondary,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            widget.song.artist,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              info(Icons.calendar_today, widget.song.year.toString(),
                  Colors.white),
              info(Icons.access_time, widget.song.duration.toString(),
                  Colors.white),
              info(
                  Icons.favorite, widget.song.popularity.toString(), secondary),
            ],
          )
        ],
      ),
    );
  }
}
