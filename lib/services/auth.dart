import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_recommender/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String _url = "https://muzic-recommender.herokuapp.com";

late User _currentUser;

Future<User> registerUser(
    String email, String password, String username) async {
  final pref = await SharedPreferences.getInstance();
  final response = await http.post(
    Uri.parse(_url + '/user/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "userName": username,
      "email": email,
      "password": password
    }),
  );

  if (response.statusCode == 201) {
    User user = User.fromJson(jsonDecode(response.body));
    pref.setString('token', user.token.toString());
    pref.setString('email', user.email.toString());
    pref.setString('userName', user.userName.toString());
    return user;
  } else {
    print(response.statusCode);
    throw Exception(response.body);
  }
}

Future<User> loginUser(String email, String password) async {
  final pref = await SharedPreferences.getInstance();
  final response = await http.post(
    Uri.parse(_url + '/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{"email": email, "password": password}),
  );

  if (response.statusCode == 200) {
    User user = User.fromJson(jsonDecode(response.body));
    pref.setString('token', user.token.toString());
    pref.setString('email', user.email.toString());
    pref.setString('userName', user.userName.toString());
    return user;
  } else {
    print(response.statusCode);
    throw Exception(response.body);
  }
}

Future<bool> logOutUser() async {
  final response = await http.post(
    Uri.parse(_url + '/user/logout'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + _currentUser.token,
    },
  );

  if (response.statusCode == 200) {
    final pref = await SharedPreferences.getInstance();
    pref.remove('token');
    pref.remove('email');
    pref.remove('userName');
    return true;
  } else {
    return false;
  }
}

User getUser() {
  return _currentUser;
}

void storeUser(User user) {
  _currentUser = user;
}
