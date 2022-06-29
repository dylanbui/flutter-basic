
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/typi_code/comments/comment_detail_page.dart';
import 'package:simple_auth_1/typi_code/comments/comment_detail_provider.dart';

import 'comment_list_page.dart';
import 'comment_list_provider.dart';


class CommentDetailRouter extends DbDefineRoute {
  int commentId;
  CommentDetailRouter(this.commentId);
}


class CommentCoordinator extends DbCoordinator implements DbNavigation {

  // dart multiple constructors
  // CommentCoordinator.buildWithHideTabbar() {
  //   var commentListPage = CommentListPage(nav: this,);
  //   commentListPage.showAppBar = false;
  //   rootPage = ChangeNotifierProvider<CommentListProvider>.value(value: CommentListProvider(), child: commentListPage,);
  // }

  CommentCoordinator({bool showAppBarOnRootPage = true}) : super() {
    var commentListPage = CommentListPage(nav: this,);
    commentListPage.showAppBar = showAppBarOnRootPage;
    rootPage = ChangeNotifierProvider<CommentListProvider>.value(value: CommentListProvider(), child: commentListPage,);
  }

  @override
  void start(BuildContext fromContext) {
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void startSameRootPage(BuildContext fromContext) {
    // TODO: implement startSameRootController
    // Navigator.pushAndRemoveUntil(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),
    //         (route) => route.isFirst == true);

    Navigator.pushAndRemoveUntil(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft), (route) => false);
  }

  @override
  void navigate(DbDefineRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

    if (toRoute is CommentDetailRouter) {
      // Navigation to ForgotPasswordRouter
      final commentDetailPage = CommentDetailPage(toRoute.commentId, nav: this,);
      var commentDetailChild = ChangeNotifierProvider<CommentDetailProvider>.value(value: CommentDetailProvider(), child: commentDetailPage,);
      Navigator.push(nextContext, PageTransition(child: commentDetailChild, type: PageTransitionType.rightToLeft),);
    }



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