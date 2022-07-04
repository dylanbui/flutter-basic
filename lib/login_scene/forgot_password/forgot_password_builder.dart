/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 15:06
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import 'auth_password/auth_password_provider.dart';
import 'auth_password/auth_password_page.dart';
import 'forgot_password_page.dart';
import 'forgot_password_provider.dart';

class AuthPasswordRoute extends DbNoteRoute {
  String strCodeAuth;
  AuthPasswordRoute(this.strCodeAuth);
}

class AuthPasswordCompletedRoute extends DbNoteRoute {
  int userId;
  AuthPasswordCompletedRoute(this.userId);
}

/* Minh hoa ForgotPassword va AuthPassword cung dung chung 1 builder, 1 router

* */

class ForgotPasswordBuilder extends DbNoteBuilder with DbNoteRouter {

  ForgotPasswordBuilder(int codeFw, String? messageFw) {
    final forgotPasswordPage = ForgotPasswordPage(codeFw, messageFw: messageFw, router: this,);
    rootPage = ChangeNotifierProvider<ForgotPasswordProvider>.value(value: ForgotPasswordProvider(), child: forgotPasswordPage,);
  }

  @override
  void start(BuildContext fromContext) {
    // TODO: implement start
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

    if (toRoute is AuthPasswordRoute) {
      // Navigation to AuthPasswordRouter
      final authPasswordPage = AuthPasswordPage(toRoute.strCodeAuth, router: this,);
      var authPasswordChild = ChangeNotifierProvider<AuthPasswordProvider>.value(value: AuthPasswordProvider(), child: authPasswordPage,);
      Navigator.push(nextContext, PageTransition(child: authPasswordChild, type: PageTransitionType.rightToLeft),);
    }



  }


}