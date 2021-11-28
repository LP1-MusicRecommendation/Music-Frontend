import 'package:flutter/material.dart';
import 'package:music_recommender/config/config.dart';
import 'package:music_recommender/models/users.dart';
import 'package:music_recommender/screens/PlayList/playList.dart';
import 'package:music_recommender/screens/widgets/toast.dart';
import 'package:music_recommender/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget buildBackgroundContainer(var height, var width) {
      return Container(
        color: primary,
        child: Align(
          alignment: Alignment.topCenter,
          child: CustomPaint(
            painter: BackGround(),
            child: Container(
              height: height * 0.4,
              width: width,
            ),
          ),
        ),
      );
    }

    Widget buildProfileImageContainer(var height, var width) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadowList,
        ),
        padding: EdgeInsets.symmetric(
            vertical: height * 0.06, horizontal: width * 0.12),
        child: Icon(Icons.person),
      );
    }

    Widget buildTextContainer(var height, var width, String value) {
      return Container(
        width: width,
        margin: EdgeInsets.only(left: 20, right: 10),
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          value,
        ),
      );
    }

    Widget buildGoToWishlistBtn(var height, var width, String value) {
      return Container(
        width: width * 0.5,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      );
    }

    Future<void> logOut() async {
      bool result = await logOutUser();
      showToast(result == true ? 'Signed out successfully' : 'Sign out Failed');
      if (result == true) {
        Navigator.pop(context);
      }
    }

    Widget buildForegroundContainer(var height, var width) {
      return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.23,
            ),
            Align(
                alignment: Alignment.center,
                child: buildProfileImageContainer(height, width)),
            SizedBox(
              height: height * 0.03,
            ),
            buildTextContainer(height, width, user.userName),
            SizedBox(
              height: height * 0.03,
            ),
            buildTextContainer(height, width, user.email),
            SizedBox(
              height: height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PlayListWidget.routeName);
              },
              child: buildGoToWishlistBtn(height, width, 'PlayList'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                logOut();
              },
              child: buildGoToWishlistBtn(height, width, 'Sign Out'),
            )
          ],
        ),
      );
    }

    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            buildBackgroundContainer(height, width),
            buildForegroundContainer(height, width),
          ],
        ),
      ),
    );
  }
}

class BackGround extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [secondary, secondary],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height - size.height / 4);
    path.lineTo(size.width, size.height / 2);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
