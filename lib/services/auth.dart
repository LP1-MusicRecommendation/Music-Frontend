import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_recommender/models/users.dart';

final String _url = "https://muzic-recommender.herokuapp.com";

late User _currentUser;

Future<User> registerUser(String email,String password,String username) async {
    final response = await http.post(
      Uri.parse(_url+'/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String,String>{
        "userName": username,
        "email":  email,
        "password": password
      }),
    );

    if(response.statusCode == 201){
      return User.fromJson(jsonDecode(response.body));
    }else{
      print(response.statusCode);
      throw Exception(response.body);
    }
}

Future<User> loginUser(String email,String password) async {
  final response = await http.post(
    Uri.parse(_url+'/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String,String>{
      "email":  email,
      "password": password
    }),
  );

  if(response.statusCode == 200){
    return User.fromJson(jsonDecode(response.body));
  }else{
    print(response.statusCode);
    throw Exception(response.body);
  }
}

Future<String> logOutUser()async{
  final response = await http.post(
    Uri.parse(_url+'/user/logout'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '+_currentUser.token,
    },
  );

  if(response.statusCode == 200){
    return 'Logged Out Successfully';
  }else{
    return 'Log Out Failed';
  }


}

User getUser(){
  return _currentUser;
}

void storeUser(User user){
  _currentUser = user;
}