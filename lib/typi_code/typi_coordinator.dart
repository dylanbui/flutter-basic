
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/login_scene/auth_password/auth_password_page.dart';
import 'package:simple_auth_1/login_scene/auth_password/auth_password_provider.dart';
import 'package:simple_auth_1/login_scene/forgot_password/forgot_password_page.dart';
import 'package:simple_auth_1/login_scene/forgot_password/forgot_password_provider.dart';
import 'package:simple_auth_1/login_scene/signup/signup_page.dart';
import 'package:simple_auth_1/login_scene/signup/signup_provider.dart';
import 'package:simple_auth_1/typi_code/comments/comment_list_page.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_page.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_provider.dart';

import '../constants.dart';
import '../login_scene/login/login_page.dart';
import '../login_scene/login/login_provider.dart';
import 'comments/comment_list_provider.dart';


// class SignUpRouter extends DbDefineRoute {
//   User user;
//   ISignupPage callback;
//   SignUpRouter(this.user, this.callback);
// }
//
// class ForgotPasswordRouter extends DbDefineRoute {
//   int codeFw;
//   String? messageFw;
//   ForgotPasswordRouter(this.codeFw, this.messageFw);
// }
//
// class AuthPasswordRouter extends DbDefineRoute {
//   String strCodeAuth;
//   AuthPasswordRouter(this.strCodeAuth);
// }

class TypiCoordinator extends DbCoordinator implements DbNavigation {

  TypiCoordinator(BuildContext context) : super(context) {

    // var postListPage = PostListPage(nav: this,);
    // rootPage = ChangeNotifierProvider<PostListProvider>.value(value: PostListProvider(), child: postListPage,);

    var commentListPage = CommentListPage(nav: this,);
    rootPage = ChangeNotifierProvider<CommentListProvider>.value(value: CommentListProvider(), child: commentListPage,);
  }

  @override
  void start() {
    Navigator.push(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void startSameRootController() {
    // TODO: implement startSameRootController
    // Navigator.pushAndRemoveUntil(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),
    //         (route) => route.isFirst == true);

    Navigator.pushAndRemoveUntil(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft), (route) => false);
  }

  @override
  void navigate(DbDefineRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

    // if (toRoute is ForgotPasswordRouter) {
    //   // Navigation to ForgotPasswordRouter
    //   final forgotPasswordPage = ForgotPasswordPage(toRoute.codeFw, messageFw: toRoute.messageFw, nav: this,);
    //   var forgotPasswordChild = ChangeNotifierProvider<ForgotPasswordProvider>.value(value: ForgotPasswordProvider(), child: forgotPasswordPage,);
    //   Navigator.push(nextContext, PageTransition(child: forgotPasswordChild, type: PageTransitionType.rightToLeft),);
    //
    // } else if (toRoute is AuthPasswordRouter) {
    //     // Navigation to AuthPasswordRouter
    //     final authPasswordPage = AuthPasswordPage(toRoute.strCodeAuth, nav: this,);
    //     var authPasswordChild = ChangeNotifierProvider<AuthPasswordProvider>.value(value: AuthPasswordProvider(), child: authPasswordPage,);
    //     Navigator.push(nextContext, PageTransition(child: authPasswordChild, type: PageTransitionType.rightToLeft),);
    //
    // } else if (toRoute is SignUpRouter) {
    //   // Navigation to SignUpRouter
    //   // const user = User("Duc", "email duc", "password duc", 1);
    //   final signupPage = SignupPage(toRoute.user, nav: this, onChangeText: (String text) {
    //     log(" Hang gui kem ---- " + text);
    //   }, callback: toRoute.callback,);
    //
    //   // Cach 1
    //   var signupChild = ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,);
    //   Navigator.push(nextContext, PageTransition(child: signupChild, type: PageTransitionType.rightToLeft),);
    //
    //   // Cach 2
    //   // Navigator.push(buildContext, PageTransition(
    //   //     child: ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider(), child: signupPage,),
    //   //     type: PageTransitionType.rightToLeft),);
    //
    // }






  }

  @override
  void pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
    }
  }

}