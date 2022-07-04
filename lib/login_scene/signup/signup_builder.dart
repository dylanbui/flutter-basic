/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 14:20
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/signup/signup_page.dart';
import 'package:simple_auth_1/login_scene/signup/signup_provider.dart';

import '../../constants.dart';
import '../../utils/logger.dart';

abstract class ISignupPage {
  void returnWithAbstractClass(String returnText);
}

class SignUpUserComplete {
  User user;
  SignUpUserComplete(this.user);
}

class SignupBuilder extends DbNoteBuilder with DbNoteRouter {

  SignupBuilder(ISignupPage listener) : super() {
    final signupPage = SignupPage(user: null, router: this, onChangeText: (String text) {
      eLog(" Hang gui kem ---- " + text);
    }, callback: listener);
    rootPage = ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,);
    // Cach 1
    // var signupChild = ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,);
    // Navigator.push(nextContext, PageTransition(child: signupChild, type: PageTransitionType.rightToLeft),);
  }

  SignupBuilder.withUser(User? user, ISignupPage listener) : super() {
    final signupPage = SignupPage(user: user, router: this, onChangeText: (String text) {
      eLog(" Hang gui kem ---- " + text);
    }, callback: listener,);
    rootPage = ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,);
  }

  @override
  void start(BuildContext fromContext) {
    // TODO: Tu cau hinh kieu animation push vao the nao
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is SignUpUserComplete) {
      // TODO: thuc hien gi khi signup user thanh cong
      // o tren da minh hoa cach goi listener
    }
  }





}