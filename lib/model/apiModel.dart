class UserLogin {
  String username;
  String password;

  UserLogin({this.username, this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"username": this.username, "password": this.password};
}

class Role {
  String role;
  Role({this.role});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}
