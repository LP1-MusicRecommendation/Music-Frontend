
class User {
  final String id;
  final String userName;
  final String email;
  final String token;

  User({required this.id, required this.email, required this.userName, required this.token});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
        id: json['_id'].toString(),
        userName: json['userName'].toString(),
        email: json['email'].toString(),
        token: json['token'].toString(),
    );
  }
}