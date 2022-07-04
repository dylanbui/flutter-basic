/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 14:05
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/login_scene/signup/signup_builder.dart';

import '../../constants.dart';
import 'login_page.dart';
import 'login_provider.dart';

class SignUpRoute extends DbNoteRoute {
  User user;
  ISignupPage callback;
  SignUpRoute(this.user, this.callback);
}

class ForgotPasswordRoute extends DbNoteRoute {
  int codeFw;
  String? messageFw;
  ForgotPasswordRoute(this.codeFw, this.messageFw);
}


class LoginBuilder extends DbNoteBuilder with DbNoteRouter {


  LoginBuilder() : super() {
    var loginPage = LoginPage(router: this,);
    // loginPage.router = this;
    rootPage = ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider(), child: loginPage,);
  }

  @override
  void start(BuildContext fromContext) {
    //var page = PageTransition(child: rootPage, type: PageTransitionType.rightToLeft, settings: const RouteSettings(name: "ten_goi"));
    // PageTransition ban chat tra ve router
    // Dat ten no la login root
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft,
        settings: const RouteSettings(name: "login_root")),);
  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is SignUpRoute) {
      var signupBuilder = SignupBuilder(toRoute.callback);
      signupBuilder.start(nextContext);
    }
  }
}