class UserModel {
  int id;
  String username;
  String password;
  String role;

  UserModel({this.id, this.username, this.password, this.role});

  factory UserModel.fromDatabaseJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        username: data['username'],
        password: data['password'],
        role: data['role'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "username": this.username,
        "password": this.password,
        "role": this.role
      };
}
