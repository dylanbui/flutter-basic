/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 14:20
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/signup/signup_page.dart';
import 'package:simple_auth_1/login_scene/signup/signup_provider.dart';

import '../../constants.dart';
import '../../utils/logger.dart';



// Listener

abstract class SignupPageListener {
  void returnWithAbstractClass(String returnText);
}

// Buildable

abstract class SignupBuildable extends DbNoteBuildable {

  Widget build(SignupPageListener listener);
  Widget buildWithUser(User user, SignupPageListener listener);

}

// Route

class SignUpUserComplete {
  User user;
  SignUpUserComplete(this.user);
}

// Builder

class SignupBuilder extends DbNoteBuilder with DbNoteRouter implements SignupBuildable {

  @override
  Widget build(SignupPageListener listener) {
    final signupPage = SignupPage(user: null, router: this, onChangeText: (String text) {
      eLog(" Hang gui kem ---- " + text);
    }, callback: listener);
    return ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,);
  }

  @override
  Widget buildWithUser(User user, SignupPageListener listener) {
    final signupPage = SignupPage(user: user, router: this, onChangeText: (String text) {
      eLog(" Hang gui kem ---- " + text);
    }, callback: listener,);
    return ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,);
  }


  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is SignUpUserComplete) {
      // TODO: thuc hien gi khi signup user thanh cong
      // o tren da minh hoa cach goi listener
    }
  }



}