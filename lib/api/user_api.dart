


import 'package:simple_auth_1/commons/network/network_constants.dart';

import '../constants.dart';

import '../login_scene/login/login_provider.dart';
import '../utils/tuple.dart';

class UserApi {

  // region Make Singleton Class
  static final UserApi _singleton = UserApi._internal();
  factory UserApi() {
    return _singleton;
  }

  UserApi._internal(); // Write constructor here  UserApi._internal() { [content] }
  // endregion

  // Future doLoginWith(String username, String password) async {
  //
  //   const url = 'https://bakeology-alpha-stage.herokuapp.com/user/recipes';
  //   const user = User("Duc Dylan", "dylan.bui@gmail.com", "password duc", 1);
  //
  //   // chờ 4 giay
  //   await Future.delayed(const Duration(seconds: 4));
  //
  //   if (username == "duc" && password == "123") {
  //     _loginResult = const Tuple(user, null);
  //   } else {
  //     const error = BaseError("Login khong thanh cong");
  //     _loginResult = const Tuple(null, error);
  //   }
  //
  // }

  Future<ResultType<User?>> doLogin(String username, String password) async {

    const url = 'https://bakeology-alpha-stage.herokuapp.com/user/recipes';
    const user = User("Duc Dylan", "dylan.bui@gmail.com", "password duc", 10);

    // chờ 4 giay
    await Future.delayed(const Duration(seconds: 3));

    if (username == "duc" && password == "123") {
      return const Tuple(user, null);
    }

    const error = BaseError(404, "Login khong thanh cong");
    return const Tuple(null, error);

    // try {
    //   // final response = await http.get(Uri(url));
    //
    // } catch(error) {
    //
    // }
    // return Tuple(null, null);
  }
}