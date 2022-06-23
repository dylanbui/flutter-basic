
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/typi_code/posts/post_detail_page.dart';
import 'package:simple_auth_1/typi_code/posts/post_detail_provider.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_page.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_provider.dart';


class PostDetailRouter extends DbDefineRoute {
  int postId;
  PostDetailRouter(this.postId);
}


class PostCoordinator extends DbCoordinator implements DbNavigation {

  PostCoordinator({bool showAppBar = true}) : super() {
    var postListPage = PostListPage(nav: this,);
    postListPage.showAppBar = showAppBar;
    rootPage = ChangeNotifierProvider<PostListProvider>.value(value: PostListProvider(), child: postListPage,);
  }

  @override
  void start(BuildContext fromContext) {
    Navigator.push(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),);
  }

  @override
  void startSameRootController(BuildContext fromContext) {
    // TODO: implement startSameRootController
    // Navigator.pushAndRemoveUntil(buildContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft),
    //         (route) => route.isFirst == true);

    Navigator.pushAndRemoveUntil(fromContext, PageTransition(child: rootPage, type: PageTransitionType.rightToLeft), (route) => false);
  }

  @override
  void navigate(DbDefineRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

    if (toRoute is PostDetailRouter) {
      // Navigation to PostDetailRouter
      final postDetailPage = PostDetailPage(toRoute.postId , nav: this,);
      var postDetailChild = ChangeNotifierProvider<PostDetailProvider>.value(value: PostDetailProvider(), child: postDetailPage,);
      Navigator.push(nextContext, PageTransition(child: postDetailChild, type: PageTransitionType.rightToLeft),);

    }

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