/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 21/06/2022 - 10:41
 * To change this template use File | Settings | File Templates.
 */


import 'package:json_annotation/json_annotation.dart';
import 'package:simple_auth_1/utils/shared_preferences.dart';

part 'session_user.g.dart';

@JsonSerializable()
class SessionUser {

  int id;
  String? userName;
  String? email;
  String? password;
  String? fullName;
  String? token;

  SessionUser({required this.id, this.userName, this.email, this.password, this.fullName});

  factory SessionUser.fromJson(Map<String, dynamic> json) => _$SessionUserFromJson(json);

  factory SessionUser.fromSystem() {
    var data = DbSharedPreferences().get("SESSION_USER"); //as? Map<String, dynamic>;
    if (data is Map<String, dynamic>) {
      return _$SessionUserFromJson(data);
    }
    return SessionUser(id: -1); // Default user
  }

  Map<String, dynamic> toJson() => _$SessionUserToJson(this);


  @override
  String toString() {
    return toJson().toString();
  }

}


extension SessionUserStatus on SessionUser {

  bool isLogin() {
    return token != null;
    // return token != null ? true : false;
  }

  void saveToSystem() {
    DbSharedPreferences().set("SESSION_USER", this);
  }


}