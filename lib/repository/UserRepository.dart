import 'package:school_app/apiutils/api_connection.dart';
import 'package:school_app/dao/userDao.dart';
import 'package:school_app/model/apiModel.dart';
import 'package:school_app/model/userModel.dart';

class UserRepository {
  final userDao = UserDao();

  Future<UserModel> authenticate({String username, String password}) async {
    UserLogin userLogin = UserLogin(username: username, password: password);
    Role role = await login(userLogin);
    UserModel user = UserModel(
      id: 0,
      username: username,
      password: password,
      role: role.role,
    );
    return user;
  }

  Future<String> getRole({int id}) async {
    String result = await userDao.getRole(0);
    return result;
  }

  Future<bool> hasRole({int id}) async {
    bool result = await userDao.isUser(0);
    return result;
  }

  Future<void> persistRole({UserModel user}) async {
    await userDao.createUser(user);
  }

  Future<void> delteRole({int id}) async {
    await userDao.deleteUser(id);
  }
}
