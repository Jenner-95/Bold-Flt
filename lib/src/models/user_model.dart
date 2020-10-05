class User {
  String email;

  User({this.email});

  factory User.fromMap(Map<String, dynamic> obj) => User(email: obj['email']);
}
