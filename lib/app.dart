/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 21/06/2022 - 15:40
 * To change this template use File | Settings | File Templates.
 */


import 'package:simple_auth_1/session_user.dart';

class App {

  late SessionUser currentUser;

  // region Make Singleton Class
  static final App _singleton = App._internal();
  factory App() {
    return _singleton;
  }

  App._internal();

  // Start load on main()
  Future<void> startLoad() async {
    // Su dung load cac gia tri ban dau
    currentUser = SessionUser.fromSystem();
  }

// endregion


}