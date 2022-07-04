/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 15:35
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import 'comment_detail_page.dart';
import 'comment_detail_provider.dart';
import 'comment_list_page.dart';
import 'comment_list_provider.dart';


class CommentDetailRoute extends DbNoteRoute {
  int commentId;
  CommentDetailRoute(this.commentId);
}

/* Minh hoa CommentListPage va CommentDetailPage cung dung chung 1 builder, 1 router

* */

class CommentBuilder extends DbNoteBuilder with DbNoteRouter {

  CommentBuilder({bool showAppBarOnRootPage = true}) : super() {
    var commentListPage = CommentListPage(router: this,);
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
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {
    if (toRoute is CommentDetailRoute) {
      // Navigation to ForgotPasswordRouter
      final commentDetailPage = CommentDetailPage(toRoute.commentId, router: this,);
      var commentDetailChild = ChangeNotifierProvider<CommentDetailProvider>.value(value: CommentDetailProvider(), child: commentDetailPage,);
      Navigator.push(nextContext, PageTransition(child: commentDetailChild, type: PageTransitionType.rightToLeft),);
    }
  }


}