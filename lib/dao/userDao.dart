import 'package:school_app/database/userDatabase.dart';
import 'package:school_app/model/userModel.dart';

class UserDao {
  final dbProvide = DatabaseProvider.dbProvider;

  Future<int> createUser(UserModel user) async {
    final db = await dbProvide.database;
    var result = await db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<String> getRole(int id) async {
    final db = await dbProvide.database;
    var users = await db.query(userTable, where: 'id = ?', whereArgs: [id]);
    print(users);
    return "ADMIN";
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvide.database;
    var result = await db.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> isUser(int id) async {
    final db = await dbProvide.database;

    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);

      if (users.length > 0)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }
}
