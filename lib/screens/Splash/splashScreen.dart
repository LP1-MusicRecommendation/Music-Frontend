import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void auth() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    if (token == null) {
      Navigator.pushReplacementNamed(context, '/auth');
    } else {
      Navigator.pushReplacementNamed(context, '/nav');
    }
  }

  @override
  void initState() {
    auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitPouringHourGlassRefined(
      color: Color.fromARGB(255, 235, 60, 98),
      size: 100,
    );
  }
}
