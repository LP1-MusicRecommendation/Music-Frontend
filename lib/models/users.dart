
class User {
  final String id;
  final String userName;
  final String email;
  final String token;

  User({required this.id, required this.email, required this.userName, required this.token});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
        id: json['user']['_id'].toString(),
        userName: json['user']['userName'].toString(),
        email: json['user']['email'].toString(),
        token: json['token'].toString(),
    );
  }
}